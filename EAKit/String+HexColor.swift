
import Foundation

#if !os(Linux)
    #if os(macOS)
        import Cocoa
    #else
        import UIKit
    #endif
#endif

// MARK: - Hex
public extension String {
    
    public var validatedHexString: String? {
        if self.isEmpty { return nil }
        
        //guard self.characters.first == "#" else { return nil }
        
        let length = self.length
        guard length == 4 || length == 5 || length == 7 || length == 9 else { return nil }
        
        let colorString = self.replacingOccurrences(of: "#", with: "").uppercased()
        
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
