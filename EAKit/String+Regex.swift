
import Foundation

public enum Regex: String {
    
    case Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
    case Number = "^[0-9]+$"
    
    var pattern: String {
        return rawValue
    }
}

public extension String {
    
    public func match(pattern: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, count)) != nil
        } catch {
            return false
        }
    }
    
    public func isEmail() -> Bool {
        return match(pattern: Regex.Email.pattern)
    }
    
    public func isNumber() -> Bool {
        return match(pattern: Regex.Number.pattern)
    }
}
