//
//  ColorExtensions.swift
//  EAKit-iOS
//
//  Created by Elias Abel on 9/27/17.
//  Copyright © 2017 EAKit
//

#if os(macOS)
import Cocoa
/// aka `NSColor`
public typealias Color = NSColor
#else
import UIKit
/// aka `UIColor`
public typealias Color = UIColor
#endif

#if !os(watchOS)
import CoreImage
#endif

// MARK: - Properties
public extension Color {
	
	/// EAKit: Random color.
	public static var random: Color {
		let r = Int(arc4random_uniform(255))
		let g = Int(arc4random_uniform(255))
		let b = Int(arc4random_uniform(255))
        return Color(red: r, green: g, blue: b)!
	}
	
	/// EAKit: RGB components for a Color (between 0 and 255).
	///
	///		UIColor.red.rgbComponents.red -> 255
	///		NSColor.green.rgbComponents.green -> 255
	///		UIColor.blue.rgbComponents.blue -> 255
	///
	public var rgbComponents: (red: Int, green: Int, blue: Int) {
		var components: [CGFloat] {
			let c = cgColor.components!
			if c.count == 4 {
				return c
			}
			return [c[0], c[0], c[0], c[1]]
		}
		let r = components[0]
		let g = components[1]
		let b = components[2]
		return (red: Int(r * 255.0), green: Int(g * 255.0), blue: Int(b * 255.0))
	}
	
	/// EAKit: RGB components for a Color represented as CGFloat numbers (between 0 and 1)
	///
	///		UIColor.red.rgbComponents.red -> 1.0
	///		NSColor.green.rgbComponents.green -> 1.0
	///		UIColor.blue.rgbComponents.blue -> 1.0
	///
	public var cgFloatComponents: (red: CGFloat, green: CGFloat, blue: CGFloat) {
		var components: [CGFloat] {
			let c = cgColor.components!
			if c.count == 4 {
				return c
			}
			return [c[0], c[0], c[0], c[1]]
		}
		let r = components[0]
		let g = components[1]
		let b = components[2]
		return (red: r, green: g, blue: b)
	}
	
	/// EAKit: Get components of hue, saturation, and brightness, and alpha (read-only).
	public var hsbaComponents: (hue: CGFloat, saturation: CGFloat, brightness: CGFloat, alpha: CGFloat) {
		var h: CGFloat = 0.0
		var s: CGFloat = 0.0
		var b: CGFloat = 0.0
		var a: CGFloat = 0.0
				
		self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
		return (hue: h, saturation: s, brightness: b, alpha: a)
	}
	
	/// EAKit: Hexadecimal value string (read-only).
	public var hexString: String {
        let components: [Int] = {
            let c = cgColor.components!
            let components = c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
            return components.map { Int($0 * 255.0) }
        }()
        return String(format: "#%02X%02X%02X", components[0], components[1], components[2])
	}
	
	/// EAKit: Short hexadecimal value string (read-only, if applicable).
	public var shortHexString: String? {
		let string = hexString.replacingOccurrences(of: "#", with: "")
		let chrs = Array(string)
		guard chrs[0] == chrs[1], chrs[2] == chrs[3], chrs[4] == chrs[5] else { return nil }
		return "#\(chrs[0])\(chrs[2])\(chrs[4])"
	}
	
	/// EAKit: Short hexadecimal value string, or full hexadecimal string if not possible (read-only).
	public var shortHexOrHexString: String {
        let components: [Int] = {
            let c = cgColor.components!
            let components = c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
            return components.map { Int($0 * 255.0) }
        }()
        let hexString = String(format: "#%02X%02X%02X", components[0], components[1], components[2])
        let string = hexString.replacingOccurrences(of: "#", with: "")
        let chrs = Array(string)
        guard chrs[0] == chrs[1], chrs[2] == chrs[3], chrs[4] == chrs[5] else { return hexString }
        return "#\(chrs[0])\(chrs[2])\(chrs[4])"
	}
	
	/// EAKit: Alpha of Color (read-only).
	public var alpha: CGFloat {
		return cgColor.alpha
	}
	
	#if !os(watchOS)
	/// EAKit: CoreImage.CIColor (read-only)
	public var coreImageColor: CoreImage.CIColor? {
		return CoreImage.CIColor(color: self)
	}
	#endif
	
	/// EAKit: Get UInt representation of a Color (read-only).
	public var uInt: UInt {
        let c: [CGFloat] = {
            let c = cgColor.components!
            return c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
        }()
		
		var colorAsUInt32: UInt32 = 0
		colorAsUInt32 += UInt32(c[0] * 255.0) << 16
		colorAsUInt32 += UInt32(c[1] * 255.0) << 8
		colorAsUInt32 += UInt32(c[2] * 255.0)
		
		return UInt(colorAsUInt32)
	}
	
	/// EAKit: Get color complementary (read-only, if applicable).
	public var complementary: Color? {
        let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
        let convertColorToRGBSpace: ((_ color: Color) -> Color?) = { color -> Color? in
            if self.cgColor.colorSpace!.model == CGColorSpaceModel.monochrome {
                let oldComponents = self.cgColor.components
                let components: [CGFloat] = [ oldComponents![0], oldComponents![0], oldComponents![0], oldComponents![1]]
                let colorRef = CGColor(colorSpace: colorSpaceRGB, components: components)
                let colorOut = Color(cgColor: colorRef!)
                return colorOut
            } else {
                return self
            }
        }
        
        let c = convertColorToRGBSpace(self)
        guard let componentColors = c?.cgColor.components else { return nil }
        
        let r: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[0]*255), 2.0))/255
        let g: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[1]*255), 2.0))/255
        let b: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[2]*255), 2.0))/255
        
        return Color(red: r, green: g, blue: b, alpha: 1.0)
	}
	
    /// EAKit: Get the reversed color (read-only, if applicable).
    public var reversed: Color? {
        return self.complementary
    }
}

// MARK: - Methods
public extension Color {
	
	/// EAKit: Blend two Colors
	///
	/// - Parameters:
	///   - color1: first color to blend
	///   - intensity1: intensity of first color (default is 0.5)
	///   - color2: second color to blend
	///   - intensity2: intensity of second color (default is 0.5)
	/// - Returns: Color created by blending first and seond colors.
	public static func blend(_ color1: Color, intensity1: CGFloat = 0.5, with color2: Color, intensity2: CGFloat = 0.5) -> Color {
		// http://stackoverflow.com/questions/27342715/blend-uicolors-in-swift
		
		let total = intensity1 + intensity2
		let level1 = intensity1/total
		let level2 = intensity2/total
		
		guard level1 > 0 else { return color2 }
		guard level2 > 0 else { return color1 }
		
        let components1: [CGFloat] = {
            let c = color1.cgColor.components!
            return c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
        }()
        let components2: [CGFloat] = {
            let c = color2.cgColor.components!
            return c.count == 4 ? c : [c[0], c[0], c[0], c[1]]
        }()
		
		let r1 = components1[0]
		let r2 = components2[0]
		
		let g1 = components1[1]
		let g2 = components2[1]
		
		let b1 = components1[2]
		let b2 = components2[2]
		
		let a1 = color1.cgColor.alpha
		let a2 = color2.cgColor.alpha
		
		let r = level1*r1 + level2*r2
		let g = level1*g1 + level2*g2
		let b = level1*b1 + level2*b2
		let a = level1*a1 + level2*a2
		
		return Color(red: r, green: g, blue: b, alpha: a)
        
	}
    
    /// EAKit: Lighten a color
    ///
    ///     let color = Color(red: r, green: g, blue: b, alpha: a)
    ///     let lighterColor: Color = color.lighten(by: 0.2)
    ///
    /// - Parameter percentage: Percentage by which to lighten the color
    /// - Returns: A lightened color
    public func lighten(by percentage: CGFloat = 0.2) -> Color {
        // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return Color(red: min(r + percentage, 1.0),
                     green: min(g + percentage, 1.0),
                     blue: min(b + percentage, 1.0),
                     alpha: a)
    }
    
    /// EAKit: Darken a color
    ///
    ///     let color = Color(red: r, green: g, blue: b, alpha: a)
    ///     let darkerColor: Color = color.darken(by: 0.2)
    ///
    /// - Parameter percentage: Percentage by which to darken the color
    /// - Returns: A darkened color
    public func darken(by percentage: CGFloat = 0.2) -> Color {
        // https://stackoverflow.com/questions/38435308/swift-get-lighter-and-darker-color-variations-for-a-given-uicolor
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return Color(red: max(r - percentage, 0),
                     green: max(g - percentage, 0),
                     blue: max(b - percentage, 0),
                     alpha: a)
    }
}

// MARK: - Initializers
public extension Color {
	
	/// EAKit: Create NSColor from RGB values with optional transparency.
	///
	/// - Parameters:
	///   - red: red component.
	///   - green: green component.
	///   - blue: blue component.
	///   - transparency: optional transparency value (default is 1).
	public convenience init?(red: Int, green: Int, blue: Int, transparency: CGFloat = 1) {
		guard red >= 0 && red <= 255 else { return nil }
		guard green >= 0 && green <= 255 else { return nil }
		guard blue >= 0 && blue <= 255 else { return nil }
		
		var trans = transparency
		if trans < 0 { trans = 0 }
		if trans > 1 { trans = 1 }
		
		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: trans)
	}
	
	/// EAKit: Create NSColor from hexadecimal value with optional transparency.
	///
	/// - Parameters:
	///   - hex: hex Int (example: 0xDECEB5).
	///   - transparency: optional transparency value (default is 1).
	public convenience init?(hexValue: Int, transparency: CGFloat = 1) {
		var trans = transparency
		if trans < 0 { trans = 0 }
		if trans > 1 { trans = 1 }
		
		let red = (hexValue >> 16) & 0xff
		let green = (hexValue >> 8) & 0xff
		let blue = hexValue & 0xff
		self.init(red: red, green: green, blue: blue, transparency: trans)
	}
	
	/// EAKit: Create Color from hexadecimal string with optional transparency (if applicable).
	///
	/// - Parameters:
	///   - hexString: hexadecimal string (examples: EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
	///   - transparency: optional transparency value (default is 1).
	public convenience init?(hexString: String, transparency: CGFloat) {
		var string = ""
		if hexString.lowercased().hasPrefix("0x") {
			string =  hexString.replacingOccurrences(of: "0x", with: "")
		} else if hexString.hasPrefix("#") {
			string = hexString.replacingOccurrences(of: "#", with: "")
		} else {
			string = hexString
		}
		
		if string.count == 3 { // convert hex to 6 digit format if in short format
			var str = ""
			string.forEach { str.append(String(repeating: String($0), count: 2)) }
			string = str
		}
		
		guard let hexValue = Int(string, radix: 16) else { return nil }
		
        var trans = transparency
        if trans < 0 { trans = 0 }
        if trans > 1 { trans = 1 }
        
        let red = (hexValue >> 16) & 0xff
        let green = (hexValue >> 8) & 0xff
        let blue = hexValue & 0xff
        self.init(red: red, green: green, blue: blue, transparency: trans)
	}
	
	/// EAKit: Create Color from a complementary of a Color (if applicable).
	///
	/// - Parameter color: color of which opposite color is desired.
	public convenience init?(complementaryFor color: Color) {
		let colorSpaceRGB = CGColorSpaceCreateDeviceRGB()
		let convertColorToRGBSpace: ((_ color: Color) -> Color?) = { color -> Color? in
			if color.cgColor.colorSpace!.model == CGColorSpaceModel.monochrome {
				let oldComponents = color.cgColor.components
				let components: [CGFloat] = [ oldComponents![0], oldComponents![0], oldComponents![0], oldComponents![1]]
				let colorRef = CGColor(colorSpace: colorSpaceRGB, components: components)
				let colorOut = Color(cgColor: colorRef!)
				return colorOut
			} else {
				return color
			}
		}
		
		let c = convertColorToRGBSpace(color)
		guard let componentColors = c?.cgColor.components else { return nil }
		
		let r: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[0]*255), 2.0))/255
		let g: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[1]*255), 2.0))/255
		let b: CGFloat = sqrt(pow(255.0, 2.0) - pow((componentColors[2]*255), 2.0))/255
		self.init(red: r, green: g, blue: b, alpha: 1.0)
	}
	
}

public extension Color {
    public enum HexadecimalNotationMode: Int {
        case rgb = 3
        case rgba = 4
        case rrggbb = 6
        case aarrggbb = 8
        
        public var digits: Int {
            return self.rawValue
        }
        
        public init?(hexString: String) {
            let colorString = hexString.replacingOccurrences(of: ["#", "0x"], with: "")
            guard let mode = Color.HexadecimalNotationMode.init(rawValue: colorString.length) else {
                return nil
            }
            self = mode
        }
    }
    
    /// EAKit: Create Color from hexadecimal string with optional transparency (if applicable).
    ///
    /// Learn more about [CSS hex color](https://drafts.csswg.org/css-color/#hex-notation)
    ///
    /// - Parameters:
    ///   - hexString: hexadecimal string (examples: 0000ffcc, #0000ffcc, EDE7F6, 0xEDE7F6, #EDE7F6, #0ff, 0xF0F, ..).
    public convenience init?(hexString: String) {
        let colorString = hexString.replacingOccurrences(of: ["#", "0x"], with: "")
        
        guard let mode = Color.HexadecimalNotationMode.init(rawValue: colorString.length) else {
            return nil
        }
        
        var hexValue: UInt32 = 0
        guard Scanner(string: colorString).scanHexInt32(&hexValue) else {
            return nil
        }
        
        let r, g, b, a, divisor: CGFloat
        switch mode {
        case .rgb:
            divisor = 15
            r = CGFloat((hexValue & 0xF00) >> 8) / divisor
            g = CGFloat((hexValue & 0x0F0) >> 4) / divisor
            b = CGFloat( hexValue & 0x00F) / divisor
            a = 1
            break
        case .rgba:
            divisor = 15
            r = CGFloat((hexValue & 0xF000) >> 12) / divisor
            g = CGFloat((hexValue & 0x0F00) >> 8) / divisor
            b = CGFloat((hexValue & 0x00F0) >> 4) / divisor
            a = CGFloat( hexValue & 0x000F) / divisor
            break
        case .rrggbb:
            divisor = 255
            r = CGFloat((hexValue & 0xFF0000) >> 16) / divisor
            g = CGFloat((hexValue & 0x00FF00) >> 8) / divisor
            b = CGFloat( hexValue & 0x0000FF) / divisor
            a = 1
            break
        case .aarrggbb:
            divisor = 255
            r = CGFloat((hexValue & 0xFF000000) >> 24) / divisor
            g = CGFloat((hexValue & 0x00FF0000) >> 16) / divisor
            b = CGFloat((hexValue & 0x0000FF00) >> 8) / divisor
            a = CGFloat( hexValue & 0x000000FF) / divisor
            break
        }
        #if os(macOS)
        self.init(calibratedRed: r, green: g, blue: b, alpha: a)
        #else
        self.init(red: r, green: g, blue: b, alpha: a)
        #endif
    }
    
    //    /// See [more about CSS hex color](https://drafts.csswg.org/css-color/#hex-notation)
    //    public convenience init?(hex aHexString: String) {
    //        let colorString = aHexString.replacingOccurrences(of: "#", with: "").uppercased()
    //        let a, r, g, b: CGFloat
    //        switch (colorString.length) {
    //        case 3: // #RGB
    //            a = 1.0
    //            r = Color.colorComponent(from: colorString, start: 0, length: 1)
    //            g = Color.colorComponent(from: colorString, start: 1, length: 1)
    //            b = Color.colorComponent(from: colorString, start: 2, length: 1)
    //            break
    //        case 4: // #ARGB
    //            a = Color.colorComponent(from: colorString, start: 0, length: 1)
    //            r = Color.colorComponent(from: colorString, start: 1, length: 1)
    //            g = Color.colorComponent(from: colorString, start: 2, length: 1)
    //            b = Color.colorComponent(from: colorString, start: 3, length: 1)
    //            break
    //        case 6: // #RRGGBB
    //            a = 1.0
    //            r = Color.colorComponent(from: colorString, start: 0, length: 2)
    //            g = Color.colorComponent(from: colorString, start: 2, length: 2)
    //            b = Color.colorComponent(from: colorString, start: 4, length: 2)
    //            break
    //        case 8: // #AARRGGBB
    //            a = Color.colorComponent(from: colorString, start: 0, length: 2)
    //            r = Color.colorComponent(from: colorString, start: 2, length: 2)
    //            g = Color.colorComponent(from: colorString, start: 4, length: 2)
    //            b = Color.colorComponent(from: colorString, start: 6, length: 2)
    //            break
    //        default:
    //            return nil
    //        }
    //        self.init(red: r, green: g, blue: b, alpha: a)
    //    }
    //
    //    public class func colorComponent(from string: String, start s: Int, length l: Int) -> CGFloat {
    //        let substring = (string as NSString).substring(with: NSRange.init(location: s, length: l))
    //        let fullhex = l == 2 ? substring : substring + substring
    //        var hexComponent: UInt64 = 0
    //        Scanner.init(string: fullhex).scanHexInt64(&hexComponent)
    //        return CGFloat(hexComponent) / 255.0
    //    }
}
