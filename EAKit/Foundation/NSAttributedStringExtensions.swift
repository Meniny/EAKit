//
//  NSAttributedStringExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 26/11/2016.
//  Copyright © 2016 EAKit
//

#if os(macOS)
	import Cocoa
#else
	import UIKit
#endif

// MARK: - Properties
public extension NSAttributedString {
	
	#if os(iOS)
	/// EAKit: Bolded string.
	public var bolded: NSAttributedString {
		return applying(attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
	}
	#endif
	
	/// EAKit: Underlined string.
	public var underlined: NSAttributedString {
		return applying(attributes: [.underlineStyle: NSUnderlineStyle.styleSingle.rawValue])
	}
	
	#if os(iOS)
	/// EAKit: Italicized string.
	public var italicized: NSAttributedString {
		return applying(attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
	}
	#endif
	
	/// EAKit: Struckthrough string.
	public var struckthrough: NSAttributedString {
		return applying(attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.styleSingle.rawValue as Int)])
	}
	
	/// EAKit: Dictionary of the attributes applied across the whole string
	public var attributes: [NSAttributedStringKey: Any] {
		return attributes(at: 0, effectiveRange: nil)
	}
	
}

// MARK: - Methods
public extension NSAttributedString {
	
	/// EAKit: Applies given attributes to the new instance of NSAttributedString initialized with self object
	///
	/// - Parameter attributes: Dictionary of attributes
	/// - Returns: NSAttributedString with applied attributes
	fileprivate func applying(attributes: [NSAttributedStringKey: Any]) -> NSAttributedString {
		let copy = NSMutableAttributedString(attributedString: self)
		let range = (string as NSString).range(of: string)
		copy.addAttributes(attributes, range: range)
		
		return copy
	}
	
	#if os(macOS)
	/// EAKit: Add color to NSAttributedString.
	///
	/// - Parameter color: text color.
	/// - Returns: a NSAttributedString colored with given color.
	public func colored(with color: NSColor) -> NSAttributedString {
	return applying(attributes: [.foregroundColor: color])
	}
	#else
	/// EAKit: Add color to NSAttributedString.
	///
	/// - Parameter color: text color.
	/// - Returns: a NSAttributedString colored with given color.
	public func colored(with color: UIColor) -> NSAttributedString {
		return applying(attributes: [.foregroundColor: color])
	}
	#endif
	
	/// EAKit: Apply attributes to substrings matching a regular expression
	///
	/// - Parameters:
	///   - attributes: Dictionary of attributes
	///   - pattern: a regular expression to target
	/// - Returns: An NSAttributedString with attributes applied to substrings matching the pattern
	public func applying(attributes: [NSAttributedStringKey: Any], toRangesMatching pattern: String) -> NSAttributedString {
		guard let pattern = try? NSRegularExpression(pattern: pattern, options: []) else { return self }
		
		let matches = pattern.matches(in: string, options: [], range: NSRange(0..<length))
		let result = NSMutableAttributedString(attributedString: self)
		
		for match in matches {
			result.addAttributes(attributes, range: match.range)
		}
		
		return result
	}
	
	/// EAKit: Apply attributes to occurrences of a given string
	///
	/// - Parameters:
	///   - attributes: Dictionary of attributes
	///   - target: a subsequence string for the attributes to be applied to
	/// - Returns: An NSAttributedString with attributes applied on the target string
	public func applying<T: StringProtocol>(attributes: [NSAttributedStringKey: Any], toOccurrencesOf target: T) -> NSAttributedString {
		let pattern = "\\Q\(target)\\E"
		
		return applying(attributes: attributes, toRangesMatching: pattern)
	}
	
}

// MARK: - Operators
public extension NSAttributedString {
	
	/// EAKit: Add a NSAttributedString to another NSAttributedString.
	///
	/// - Parameters:
	///   - lhs: NSAttributedString to add to.
	///   - rhs: NSAttributedString to add.
	public static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
		let ns = NSMutableAttributedString(attributedString: lhs)
		ns.append(rhs)
		lhs = ns
	}
	
	/// EAKit: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
	///
	/// - Parameters:
	///   - lhs: NSAttributedString to add.
	///   - rhs: NSAttributedString to add.
	/// - Returns: New instance with added NSAttributedString.
	public static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
		let ns = NSMutableAttributedString(attributedString: lhs)
		ns.append(rhs)
		return NSAttributedString(attributedString: ns)
	}
	
	/// EAKit: Add a NSAttributedString to another NSAttributedString.
	///
	/// - Parameters:
	///   - lhs: NSAttributedString to add to.
	///   - rhs: String to add.
	public static func += (lhs: inout NSAttributedString, rhs: String) {
		lhs += NSAttributedString(string: rhs)
	}
	
	/// EAKit: Add a NSAttributedString to another NSAttributedString and return a new NSAttributedString instance.
	///
	/// - Parameters:
	///   - lhs: NSAttributedString to add.
	///   - rhs: String to add.
	/// - Returns: New instance with added NSAttributedString.
	public static func + (lhs: NSAttributedString, rhs: String) -> NSAttributedString {
		return lhs + NSAttributedString(string: rhs)
	}
	
}

//public enum DynamicTypeBehavior: String, Equatable {
//    case noScaling
//    case scaleToStandardSizes // excludes huge accessibility sizes
//    case scaleToAllSizes // includes huge accessibility sizes
//}

#if os(macOS)
public typealias LineBreaking = NSParagraphStyle.LineBreakMode
#else
public typealias LineBreaking = NSLineBreakMode
#endif

public enum NSStringAttribute: Equatable {
    case font(Font)
    case color(Color)
    case background(Color)
    case lineSpace(CGFloat)
    case paragraphSpacing(CGFloat)
    case lineBreak(LineBreaking)
    case indents(CGFloat, CGFloat)
    case underline(Color, Int)
    case strikethrough(Color, Int)
    case attachment(NSTextAttachment)
    case direction(NSWritingDirection)
}

extension NSAttributedString {
    
    public convenience init(string s: String, attributes: [NSStringAttribute]) {
        let nsparagraph = NSMutableParagraphStyle.init()
        var nsattributes: [NSAttributedStringKey: Any] = [:]
        
        for attr in attributes {
            switch attr {
            case .font(let f):
                nsattributes[.font] = f
            case .color(let c):
                nsattributes[.foregroundColor] = c
            case .background(let c):
                nsattributes[.backgroundColor] = c
            case .lineSpace(let ls):
                nsparagraph.lineSpacing = ls
            case .paragraphSpacing(let ps):
                nsparagraph.paragraphSpacing = ps
            case .lineBreak(let lb):
                nsparagraph.lineBreakMode = lb
            case .indents(let h, let t):
                nsparagraph.headIndent = h
                nsparagraph.tailIndent = t
            case .underline(let c, let w):
                nsattributes[.underlineColor] = c
                nsattributes[.underlineStyle] = w
            case .strikethrough(let c, let w):
                nsattributes[.strikethroughColor] = c
                nsattributes[.strikethroughStyle] = w
            case .attachment(let a):
                nsattributes[.attachment] = a
            case .direction(let d):
                nsparagraph.baseWritingDirection = d
            }
        }
        nsattributes[.paragraphStyle] = nsparagraph
        
        self.init(string: s, attributes: nsattributes)
    }
}
