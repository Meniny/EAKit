//
//  Screenshots.swift
//  Pods
//
//  Created by Meniny on 2017-08-17.
//
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension UIView {
        /// Capture a `UIView`, returns as `UIImage`, return `nil` if failed
        public var capturedImage: UIImage? {
            UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0)
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            layer.render(in: context)
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
        
        /// Capture a `UIView`, returns as `UIImage`
        ///
        /// - Parameter view: `UIView`
        /// - Returns: `UIImage` object, return `nil` if failed
        public static func captureImage(from view: UIView) -> UIImage? {
            return view.capturedImage
        }
    }

    public extension UIImage {
        /// Capture a `UIView`, returns as `UIImage`
        ///
        /// - Parameter view: `UIView`
        /// - Returns: `UIImage` object, return `nil` if failed
        public static func captured(from view: UIView) -> UIImage? {
            return view.capturedImage
        }
    }
#endif
