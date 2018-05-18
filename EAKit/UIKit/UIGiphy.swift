//
//  UIGiphy.swift
//  EAKit-iOS
//
//  Created by Meniny on 2018-05-18.
//

#if os(iOS)
import Foundation
import UIKit
import ImageIO

public enum UIGiphy: Equatable {
    case named(String)
    case resource(String, Bundle)
    @available(iOS 9.0, *)
    case asset(String)
    case data(Data)
    case file(URL)
    
    public var image: UIImage? {
        return try? self.loadImage()
    }
    
    public func loadImage() throws -> UIImage {
        switch self {
        case .named(let name):
            return try UIImage.gif(resource: name)
        case .resource(let name, let bundle):
            return try UIImage.gif(bundle: bundle, resource: name, ext: nil)
        case .asset(let asset):
            if #available(iOS 9.0, *) {
                return try UIImage.gif(asset: asset)
            }
            return try UIImage.gif(resource: asset)
        case .data(let data):
            return try UIImage.gif(data: data)
        case .file(let file):
            return try UIImage.gif(url: file)
        }
    }
}

extension UIImageView {
    
    public func load(gif: UIGiphy) throws {
        let img = try gif.loadImage()
        DispatchQueue.main.async {
            self.image = img
        }
    }
}

public enum UIGiphyLoadingError: String, Error {
    case notExistsSource = "Source for the image does not exist"
    //    case turnAssetFailed = "Cannot turn into NSDataAsset"
    case unknown = "Unknown Error"
    
    public var localizedDescription: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

extension UIImage {
    
    public class func gif(data: Data) throws -> UIImage {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            throw UIGiphyLoadingError.notExistsSource
        }
        guard let img = UIImage.animatedImageWithSource(source) else {
            throw UIGiphyLoadingError.unknown
        }
        
        return img
    }
    
    public class func gif(url: URL) throws -> UIImage {
        let imageData = try Data(contentsOf: url)
        return try gif(data: imageData)
    }
    
    public class func gif(bundle: Bundle = .main, resource: String, ext: String? = "gif") throws -> UIImage {
        guard let bundleURL = bundle.url(forResource: resource, withExtension: ext) else {
            throw UIGiphyLoadingError.notExistsSource
        }
        
        let imageData = try Data(contentsOf: bundleURL)
        
        return try gif(data: imageData)
    }
    
    @available(iOS 9.0, *)
    public class func gif(asset: String) throws -> UIImage {
        guard let dataAsset = NSDataAsset(name: asset) else {
            throw UIGiphyLoadingError.unknown
        }
        
        return try gif(data: dataAsset.data)
    }
}

extension UIImage {
    internal class func delayForImageAtIndex(_ index: Int, source: CGImageSource!) -> Double {
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
    
    internal class func gcdForPair(_ a: Int?, _ b: Int?) -> Int {
        var a = a
        var b = b
        // Check if one of them is nil
        if b == nil || a == nil {
            if b != nil {
                return b!
            } else if a != nil {
                return a!
            } else {
                return 0
            }
        }
        
        // Swap for modulo
        if a! < b! {
            let c = a
            a = b
            b = c
        }
        
        // Get greatest common divisor
        var rest: Int
        while true {
            rest = a! % b!
            
            if rest == 0 {
                return b! // Found it
            } else {
                a = b
                b = rest
            }
        }
    }
    
    internal class func gcdForArray(_ array: Array<Int>) -> Int {
        if array.isEmpty {
            return 1
        }
        
        var gcd = array[0]
        
        for val in array {
            gcd = UIImage.gcdForPair(val, gcd)
        }
        
        return gcd
    }
    
    internal class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
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
            let delaySeconds = UIImage.delayForImageAtIndex(Int(i),
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
        let gcd = gcdForArray(delays)
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
        let animation = UIImage.animatedImage(with: frames, duration: Double(duration) / 1000.0)
        
        return animation
    }
    
}
#endif
