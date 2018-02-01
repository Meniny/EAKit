//
//  Color.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension String {
        /// Converts hex color value string to UIColor.
        /// The string has to be a hex color value string in forms of #RGB, #ARGB, #RRGGBB and #AARRGGBB.
        public func colorValue() -> UIColor? {
            return UIColor.color(withHexString: self)
        }
        
        fileprivate var RGBColor: UIColor {
            let red = getHexValue(from: self, start: 0, length: 1)
            let green = getHexValue(from: self, start: 1, length: 1)
            let blue = getHexValue(from: self, start: 2, length: 1)
            
            return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
        }
        
        fileprivate var ARGBColor: UIColor {
            let alpha = getHexValue(from: self, start: 0, length: 1)
            let red = getHexValue(from: self, start: 1, length: 1)
            let green = getHexValue(from: self, start: 2, length: 1)
            let blue = getHexValue(from: self, start: 3, length: 1)
            
            return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha)/255)
        }
        
        fileprivate var RRGGBBColor: UIColor {
            let red = getHexValue(from: self, start: 0, length: 2)
            let green = getHexValue(from: self, start: 2, length: 2)
            let blue = getHexValue(from: self, start: 4, length: 2)
            
            return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
        }
        
        fileprivate var AARRGGBBColor: UIColor {
            let alpha = getHexValue(from: self, start: 0, length: 2)
            let red = getHexValue(from: self, start: 2, length: 2)
            let green = getHexValue(from: self, start: 4, length: 2)
            let blue = getHexValue(from: self, start: 6, length: 2)
            
            return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: CGFloat(alpha)/255)
        }
        
        fileprivate func getHexValue(from hexString: String, start: Int, length: Int) -> CUnsignedInt {
            var result: CUnsignedInt = 0
            
            let colorValue = (self as NSString).substring(with: NSRange.init(location: start, length: length))
            
            let scanner = Scanner(string: colorValue.count == 2 ? colorValue  : "\(colorValue)\(colorValue)")
            scanner.scanHexInt32(&result)
            
            return result
        }
    }

    public extension UIColor {
        /// Initializes with a hex color value string.
        /// If the conversion fails, the initialized object will have white color value.
        public convenience init(hexString: String) {
            var red: CGFloat = 1
            var green: CGFloat = 1
            var blue: CGFloat = 1
            var alpha: CGFloat = 1
            
            if let color = UIColor.color(withHexString: hexString) {
                color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
            }
            
            self.init(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        /// Converts Color to hex color value string.
        public var hexString: String? {
            guard let colorModel = cgColor.colorSpace?.model, let components = cgColor.components else {
                return nil
            }
            
            var red = 0
            var green = 0
            var blue = 0
            var alpha = 0
            
            if colorModel.rawValue == CGColorSpaceModel.monochrome.rawValue {
                red = lroundf(Float(components[0]) * 255)
                green = lroundf(Float(components[0]) * 255)
                blue = lroundf(Float(components[0]) * 255)
                alpha = lroundf(Float(components[1]) * 255)
            } else if colorModel.rawValue == CGColorSpaceModel.rgb.rawValue {
                red = lroundf(Float(components[0]) * 255)
                green = lroundf(Float(components[1]) * 255)
                blue = lroundf(Float(components[2]) * 255)
                alpha = lroundf(Float(components[3]) * 255)
            }
            
            if alpha == 255 {
                return String(format: "#%02lX%02lX%02lX", red, green, blue)
            } else if alpha < 255 {
                return String(format: "#%02lX%02lX%02lX%02lX", alpha, red, green, blue)
            } else {
                return nil
            }
        }
        
        public class func color(withHexString hexString: String) -> UIColor? {
            if let hex = hexString.validatedHexString {
                let count = hex.length
                
                switch count {
                case 3:
                    return hex.RGBColor
                case 4:
                    return hex.ARGBColor
                case 6:
                    return hex.RRGGBBColor
                case 8:
                    return hex.AARRGGBBColor
                default:
                    return nil
                }
            } else {
                return nil
            }
        }
        
    }

    // MARK: - Random

    public extension UIColor {
        public static var random: UIColor {
            let m = 255
            let r = Int.random(m)
            let g = Int.random(m)
            let b = Int.random(m)
            return UIColor(hexString: String(format: "#%02lX%02lX%02lX", r, g, b))
        }
    }

    // MARK: - Inverse

    public extension UIColor {
        public var inversed: UIColor {
            var fRed: CGFloat = 0
            var fGreen: CGFloat = 0
            var fBlue: CGFloat = 0
            var fAlpha: CGFloat = 0
            if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
                return UIColor(red: fRed, green: fGreen, blue: fBlue, alpha: fAlpha)
            }
            return self
        }
    }
#endif
