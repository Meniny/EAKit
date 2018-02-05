//
//  Regex.swift
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 2017/1/5.
//  Copyright © 2017 Meniny Lab. All rights reserved.
//

import Foundation

public enum RegexPattern: Equatable {
    case none
    case ipv4
    case illegal
    case url
    case phone
    case email
    case number(digit: Int)
    case numbers(lower: Int, upper: Int)
    case isPositiveInteger
    case double(prefix: Int, suffix: Int)
    case custom(String)
    
    public var pattern: String {
        switch self {
        case .none: return ""
        case .ipv4: return "^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$"
        case .illegal:
            return "[\\\\'\"//\\[\\]{}<>＜＞「」：；、•^\\n\\s*\r]"
        case .url:
            return "(https?|ftp|file)://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]"
        case .phone:
            return "^1[3456789]\\d{9}$"
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        case .number(digit: let digit):
            return "^\\d{\(digit)}$"
        case .numbers(let lower, let upper):
            return "^\\d{\(lower),\(upper)}$"
        case .isPositiveInteger:
            return "^\\d+$"
        case .double(let prefix, let suffix):
            return "^\\d{0,\(prefix)}$|^(\\d{0,\(prefix)}[.][0-9]{0,\(suffix)})$"
        case .custom(let str):
            return str
        }
    }
    
    public static func ==(lsh: RegexPattern,rsh: RegexPattern) -> Bool {
        return lsh.pattern == rsh.pattern
    }
}

public func == (lsh: [RegexPattern], rsh: [RegexPattern]) -> Bool {
    let l = lsh.map({ (item) -> String in return item.pattern })
    let r = rsh.map({ (item) -> String in return item.pattern })
    return l == r
}

public struct Regex : Equatable {
    
    fileprivate let matcher: NSRegularExpression
    
    public init(pattern: String) throws {
        self.matcher = try NSRegularExpression(pattern: pattern, options: [])
    }
    
    public init(pattern: String, options: NSRegularExpression.Options) throws {
        self.matcher = try NSRegularExpression(pattern: pattern, options: options)
    }
    
    /// Returns the regular expression pattern.
    public var pattern: String {
        return matcher.pattern
    }
    
    /// Returns the options used when the regular expression option was created.
    public var options: NSRegularExpression.Options {
        return matcher.options
    }
    
    /// Returns the number of capture groups in the regular expression.
    ///
    /// A capture group consists of each possible match within a regular expression. Each capture group can then be used in a replacement template to insert that value into a replacement string.
    public var numberOfCaptureGroups: Int {
        return matcher.numberOfCaptureGroups
    }
}

extension Regex: ExpressibleByStringLiteral {
    
    public typealias ExtendedGraphemeClusterLiteralType = StringLiteralType
    public typealias UnicodeScalarLiteralType = StringLiteralType
    
    public init(stringLiteral value: StringLiteralType) {
        try! self.init(pattern: value)
    }
    
    public init(extendedGraphemeClusterLiteral value: ExtendedGraphemeClusterLiteralType) {
        try! self.init(pattern: value)
    }
    
    public init(unicodeScalarLiteral value: UnicodeScalarLiteralType) {
        try! self.init(pattern: value)
    }
}

extension Regex: CustomStringConvertible {
    
    public var description: String {
        return pattern
    }
}

public protocol RegularExpressionMatchable {
    
    associatedtype Matching
    associatedtype Replacement
    
    /// Returns an array containing all the matches of the regular expression.
    func match(regex: Regex) -> [Matching]
    
    /// Returns a new string containing matching regular expressions replaced with the template.
    func replace(regex: Regex, template: Replacement) -> Replacement
    
    /// Returns the number of matches of the regular expression.
    func count(regex: Regex) -> Int
    
    /// Returns the first match of the regular expression.
    func firstMatch(regex: Regex) -> Matching?
    
    /// Returns true if any match of the regular expression.
    func isMatch(regex: Regex) -> Bool
}

public extension RegularExpressionMatchable {
    
    /// Returns the number of matches of the regular expression.
    func count(regex: Regex) -> Int {
        return self.match(regex: regex).count
    }
    
    /// Returns the first match of the regular expression.
    func firstMatch(regex: Regex) -> Matching? {
        return self.match(regex: regex).first
    }
    
    /// Returns true if any match of the regular expression.
    func isMatch(regex: Regex) -> Bool {
        return self.firstMatch(regex: regex) != nil
    }
}

extension String: RegularExpressionMatchable {
    
    /// Returns the number of matches of the regular expression in the string.
    public func count(regex: Regex) -> Int {
        let nsstring = NSString(string: self)
        let range = NSRange(location: 0, length: nsstring.length)
        return regex.matcher.numberOfMatches(in: self, options: [], range: range)
    }
    
    /// Returns true if any match of the regular expression in the string.
    public func isMatch(regex: Regex) -> Bool {
        let nsstring = NSString(string: self)
        let range = NSRange(location: 0, length: nsstring.length)
        return regex.matcher.firstMatch(in: self, options: [], range: range) != nil
    }
    
    /// Returns the first match of the regular expression in the string.
    public func firstMatch(regex: Regex) -> String? {
        let nsstring = NSString(string: self)
        let range = NSRange(location: 0, length: nsstring.length)
        let match_result = regex.matcher.firstMatch(in: self, options: [], range: range)
        return match_result.map { nsstring.substring(with: $0.range) }
    }
    
    /// Returns an array containing all the matches of the regular expression in the string.
    public func match(regex: Regex) -> [String] {
        let nsstring = NSString(string: self)
        let range = NSRange(location: 0, length: nsstring.length)
        var match_result = [String]()
        regex.matcher.enumerateMatches(in: self, options: [], range: range) { result, _, _ in
            if let _result = result {
                match_result.append(nsstring.substring(with: _result.range))
            }
        }
        return match_result
    }
    
    /// Returns a new string containing matching regular expressions replaced with the template string.
    ///
    /// The replacement is treated as a template, with $0 being replaced by the contents of the matched range, $1 by the contents of the first capture group, and so on.
    /// Additional digits beyond the maximum required to represent the number of capture groups will be treated as ordinary characters, as will a $ not followed by digits.
    /// Backslash will escape both $ and itself.
    public func replace(regex: Regex, template: String) -> String {
        let nsstring = NSString(string: self)
        let range = NSRange(location: 0, length: nsstring.length)
        return regex.matcher.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: template)
    }
}

@_inlineable
public func ~=<T: RegularExpressionMatchable> (lhs: Regex, rhs: T) -> Bool {
    return rhs.isMatch(regex: lhs)
}

@_inlineable
public func ==(lhs: Regex, rhs: Regex) -> Bool {
    return lhs.pattern == rhs.pattern && lhs.options == rhs.options
}
