
#if !os(OSX)
    import UIKit

    public extension UIImage {
        
        public convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
            let rect = CGRect(origin: CGPoint.zero, size: size)
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            color.setFill()
            UIRectFill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            if let cg = image?.cgImage {
                self.init(cgImage: cg)
            } else {
                return nil
            }
        }
    }

    public extension UIColor {
        public func toImage(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
            return UIImage(color: self, size: size)
        }
    }
#endif
