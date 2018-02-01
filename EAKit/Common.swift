
#if !os(Linux)
    #if os(macOS)
        import Cocoa
        
        public typealias AppleImage = NSImage
        public typealias AppleView = NSView
        public typealias AppleColor = NSColor
        public typealias Application = NSApplication
    #else
        import Foundation
        import UIKit
        
        #if !os(watchOS)
            public typealias AppleView = UIView
            public typealias Application = UIApplication
        #endif
        public typealias AppleImage = UIImage
        public typealias AppleColor = UIColor
    #endif
    
    public func LocalizedString(_ key: String) -> String {
        return Bundle.main.localizedString(forKey: key, value: nil, table: nil)
    }
#endif

public typealias JSONDictionary = [String: Any]
public typealias JSONArray = [JSONDictionary]

/// Same as true
public let YES = true

/// Same as false
public let NO = false

public typealias VoidClosure = @convention(block) () -> Swift.Void
public typealias void_block_t = VoidClosure


