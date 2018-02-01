
#if os(iOS)
    import Foundation
    import UIKit
    import ImageIO

    public extension UIImageView {
        
        public func gif(named name: String) {
            DispatchQueue.global().async {
                let image = UIImage.gif(named: name)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
        
        public func gif(atPath path: String) {
            DispatchQueue.global().async {
                let image = UIImage.gif(path: path)
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }

    public extension UIImage {
        
        public class func gif(data: Data) -> UIImage? {
            // Create source from data
            guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
                #if DEBUG
                print("Source for the image does not exist")
                #endif
                return nil
            }
            
            return UIImage.animatedImage(from: source)
        }
        
        public class func gif(path: String) -> UIImage? {
            let url = URL(fileURLWithPath: path)
            guard let imageData = try? Data(contentsOf: url) else {
                #if DEBUG
                print("Cannot convert image at \"\(url)\" to NSData")
                #endif
                return nil
            }
            
            return gif(data: imageData)
        }
        
        public class func gif(named name: String, atBundle bundle: Bundle = Bundle.main, subdirectory subpath: String? = nil) -> UIImage? {
            return self.gif(resource: name, withExtension: nil, atBundle: bundle, subdirectory: subpath)
        }
        
        public class func gif(resource res: String, withExtension ext: String? = nil, atBundle bundle: Bundle = Bundle.main, subdirectory subpath: String? = nil) -> UIImage? {
            // Check for existance of gif
            guard let bundleURL = bundle.url(forResource: res, withExtension: ext, subdirectory: subpath) else {
                #if DEBUG
                print("Image named \"\(res)\" does not exist")
                #endif
                return nil
            }
            
            // Validate data
            guard let imageData = try? Data(contentsOf: bundleURL) else {
                #if DEBUG
                print("Cannot convert image named \"\(res)\" to NSData")
                #endif
                return nil
            }
            
            return gif(data: imageData)
        }
        
        internal class func delayForImage(atIndex index: Int, source: CGImageSource!) -> Double {
            var delay = 0.1
            
            // Get dictionaries
            let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
            let gifPropertiesPointer = UnsafeMutablePointer<UnsafeRawPointer?>.allocate(capacity: 0)
            if CFDictionaryGetValueIfPresent(cfProperties, Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque(), gifPropertiesPointer) == false {
                return delay
            }
            
            let gifProperties:CFDictionary = unsafeBitCast(gifPropertiesPointer.pointee, to: CFDictionary.self)
            
            // Get delay time
            var delayObject: AnyObject = unsafeBitCast(
                CFDictionaryGetValue(gifProperties,
                                     Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
                to: AnyObject.self)
            if delayObject.doubleValue == 0 {
                delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                                 Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
            }
            
            delay = delayObject as? Double ?? 0
            
            if delay < 0.1 {
                delay = 0.1 // Make sure they're not too fast
            }
            
            return delay
        }
        internal class func animatedImage(from source: CGImageSource) -> UIImage? {
            let count = CGImageSourceGetCount(source)
            var images = [CGImage]()
            var delays = [Int]()
            
            // Fill arrays
            for i in 0..<count {
                // Add image
                if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                    images.append(image)
                }
                
                // At it's delay in cs
                let delaySeconds = UIImage.delayForImage(atIndex: Int(i),
                                                                source: source)
                delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
            }
            
            // Calculate full duration
            let duration: Int = {
                var sum = 0
                
                for val: Int in delays {
                    sum += val
                }
                
                return sum
            }()
            
            // Get frames
            let gcd = Int.gcd(of: delays)
            var frames = [UIImage]()
            
            var frame: UIImage
            var frameCount: Int
            for i in 0..<count {
                frame = UIImage(cgImage: images[Int(i)])
                frameCount = Int(delays[Int(i)] / gcd)
                
                for _ in 0..<frameCount {
                    frames.append(frame)
                }
            }
            
            // Heyhey
            let animation = UIImage.animatedImage(with: frames,
                                                  duration: Double(duration) / 1000.0)
            
            return animation
        }
    }
#endif
