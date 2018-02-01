//
//  String.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#elseif os(OSX)
    import Cocoa
#endif

public extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    public var length: Int {
        return self.count
    }
    
    public var hasContent: Bool {
        return !self.isEmpty
    }
    
    #if os(iOS)
        public func attributed(color: UIColor,
                               background: UIColor = UIColor.clear,
                               font: UIFont = UIFont.systemFont(ofSize: 14)) -> NSAttributedString {
            return self.attributed([
                NSAttributedStringKey.foregroundColor: color,
                NSAttributedStringKey.backgroundColor: background,
                NSAttributedStringKey.font: font
                ])
        }
    #elseif os(OSX)
        public func attributed(color: NSColor,
                               background: NSColor = NSColor.clear,
                               font: NSFont = NSFont.systemFont(ofSize: 14)) -> NSAttributedString {
            return self.attributed([
                NSAttributedStringKey.foregroundColor: color,
                NSAttributedStringKey.backgroundColor: background,
                NSAttributedStringKey.font: font
            ])
        }
    #endif
    
    public func attributed(_ attributes: [NSAttributedStringKey: Any]?) -> NSAttributedString {
        return NSAttributedString.init(string: self, attributes: attributes)
    }
}

public extension Array where Element == String {
    public var localized: [String] {
        return self.map({ (s) -> String in
            return NSLocalizedString(s, comment: "")
        })
    }
}

public extension String {
    
    public func repeating(_ time: Int, separator: String? = nil) -> String {
        if time > 1 {
            var res = [String]()
            for _ in 1...time {
                res.append(self)
            }
            if let sep = separator {
                return res.joined(separator: sep)
            }
            return res.joined()
        }
        return self
    }
    
    public func replace(_ string: String, with withString: String) -> String {
        return replacingOccurrences(of: string, with: withString)
    }
    
    public func truncate(_ length: Int, suffix: String = "...") -> String {
        if count > length {
            return self.substring(to: length) + suffix
        }
        return self
    }
    
    public func split(_ delimiter: String) -> [String] {
        let components = self.components(separatedBy: delimiter)
        return components != [""] ? components : []
    }
    
    public func trim(_ charactersSets: CharacterSet = CharacterSet.whitespaces) -> String {
        return trimmingCharacters(in: charactersSets)
    }
    
    public var uppercaseFirstLetter: String {
        guard isPresent else { return self }
        
        var string = self
        string.replaceSubrange(string.startIndex...string.startIndex,
                               with: String(string[string.startIndex]).capitalized)
        
        return string
    }
    
    public func substring(pattern: String, options: NSRegularExpression.Options = NSRegularExpression.Options.caseInsensitive) -> String? {
        if let regex = try? NSRegularExpression(pattern: pattern, options: options) {
            if let match = regex.firstMatch(in: self, options: .reportProgress, range: NSMakeRange(0, count)) {
                return (self as NSString).substring(with: match.range)
            }
        }
        return nil
    }
    
    public func substring(from: Int) -> String {
        return (self as NSString).substring(from: from)
    }
    
    public func substring(to: Int) -> String {
        return (self as NSString).substring(to: to)
    }
}

public extension String {
    
    public var integerValue: Int? { return Int(self) }
    public var intValue: Int? { return self.integerValue }
    
    public var unsignedIntegerValue: UInt? { return UInt(self) }
    public var uintValue: UInt? { return self.unsignedIntegerValue }
    
    public var doubleValue: Double? { return Double(self) }
    
    public var floatValue: Float? { return Float(self) }
}

public extension String {
    
    public func uppercasedAtSentenceBoundary() -> String {
        let string = self.lowercased()
        
        let capacity = string.count
        let mutable = NSMutableString(capacity: capacity)
        mutable.append(string)
        
        let pattern = "(?:^|\\b\\.[ ]*)(\\p{Ll})"
        
        if let regex = try? NSRegularExpression(pattern: pattern, options: .anchorsMatchLines) {
            let results = regex.matches(in: string, options: [], range: NSMakeRange(0, capacity))
            for result in results {
                let numRanges = result.numberOfRanges
                if numRanges >= 1 {
                    for i in 1..<numRanges {
                        let range = result.range(at: i)
                        let substring = mutable.substring(with: range)
                        mutable.replaceCharacters(in: range, with: substring.uppercased())
                    }
                }
            }
        }
        
        return mutable as String
    }
}

public extension String {
    
    public var base64Encoded: String? {
        return self.data(using: .utf8)?.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
    }
    
    public var base64Decoded: String? {
        guard let data = Data.init(base64Encoded: self, options: Data.Base64DecodingOptions.init(rawValue: 0)) else {
            return nil
        }
        return String.init(data: data, encoding: .utf8)
    }
    
    /// decode unicode to plain string
    public var unicodeDecodedString: String? {
        let tempString = self.replacingOccurrences(of: "\\u", with: "\\U")
            .replacingOccurrences(of:"\"", with: "\\\"")
        
        if let tempData = "\"\(tempString)\"".data(using: .utf8) {
            if let res = try? PropertyListSerialization.propertyList(from: tempData, options: [], format: nil) {
                return res as? String
            }
        }
        return nil
    }
    
    public var URLEncodedString: String {
        if #available(iOS 10.0, macOS 10.12, *) {
            if let esc = self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
                return esc
            }
            return self
        } else {
            let chars = ":&=;+!@#$()',*"
            let legalURLCharactersToBeEscaped: CFString = chars as CFString
            return CFURLCreateStringByAddingPercentEscapes(nil, self as CFString!, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
        }
    }
    
    public var URLDecodedString: String {
        if #available(iOS 10.0, macOS 10.12, *) {
            if let esc = self.removingPercentEncoding {
                return esc
            }
            return self
        } else {
            return CFURLCreateStringByReplacingPercentEscapesUsingEncoding(nil, self as CFString!, "" as CFString!, CFStringBuiltInEncodings.UTF8.rawValue) as String
        }
    }
}

//public extension String {
//    public var md5String: String {
//        return String.md5(self)
//    }
//
//    public static func md5(_ string: String) -> String {
//        let context = UnsafeMutablePointer<CC_MD5_CTX>.allocate(capacity: 1)
//        var digest = Array<UInt8>(repeating:0, count:Int(CC_MD5_DIGEST_LENGTH))
//        CC_MD5_Init(context)
//        CC_MD5_Update(context, string, CC_LONG(string.lengthOfBytes(using: String.Encoding.utf8)))
//        CC_MD5_Final(&digest, context)
//        context.deallocate(capacity: 1)
//        var hexString = ""
//        for byte in digest {
//            hexString += String(format:"%02x", byte)
//        }
//        return hexString
//    }
//}

