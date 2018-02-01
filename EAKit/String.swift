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
    public var base64Encoded: String? {
        return self.data(using: .utf8)?.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))
    }
    
    public var base64Decoded: String? {
        guard let data = Data.init(base64Encoded: self, options: Data.Base64DecodingOptions.init(rawValue: 0)) else {
            return nil
        }
        return String.init(data: data, encoding: .utf8)
    }
}

// MARK: - Hex
public extension String {
    
    public var validatedHexString: String? {
        if self.isEmpty { return nil }
        
        //guard self.characters.first == "#" else { return nil }
        
        let colorString = self.replacingOccurrences(of: "#", with: "").uppercased()
        
        let length = colorString.length
        guard [3, 4, 6, 8].contains(length) else { return nil }
        
        let disallowedCharacters = CharacterSet(charactersIn: "0123456789ABCDEF").inverted
        guard (colorString as NSString).rangeOfCharacter(from: disallowedCharacters).location == NSNotFound else {
            return nil
        }
        
        return colorString
    }
    
    /// Validates a string if it is a hex color value in forms of #RGB, #ARGB, #RRGGBB and #AARRGGBB.
    public var isHexColorString: Bool {
        return self.validatedHexString != nil
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

