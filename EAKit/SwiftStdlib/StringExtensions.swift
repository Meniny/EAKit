//
//  StringExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/5/16.
//  Copyright © 2016 EAKit
//
#if os(macOS)
	import Cocoa
#else
	import UIKit
#endif

public extension String {
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

public extension Array where Element == String {
    public var localized: [String] {
        return self.map({ (s) -> String in
            return NSLocalizedString(s, comment: "")
        })
    }
}

// MARK: - Properties
public extension String {
    
    public var length: Int {
        return self.count
    }
    
    /// A Bool value indicating whether the string is not empty.
    ///
    /// - Returns: Returns a Bool value indicating whether the string is not empty.
    public var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
    #if os(iOS)
        public func attributed(color: UIColor,
                               background: UIColor = UIColor.clear,
                               font: UIFont = UIFont.systemFont(ofSize: 14)) -> NSAttributedString {
            return self.attributed([
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.backgroundColor: background,
                NSAttributedString.Key.font: font
            ])
        }
    #elseif os(OSX)
        public func attributed(color: NSColor,
                               background: NSColor = NSColor.clear,
                               font: NSFont = NSFont.systemFont(ofSize: 14)) -> NSAttributedString {
            return self.attributed([
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.backgroundColor: background,
                NSAttributedString.Key.font: font
                ])
        }
    #endif
    
    public func attributed(_ attributes: [NSAttributedString.Key: Any]?) -> NSAttributedString {
        return NSAttributedString.init(string: self, attributes: attributes)
    }
    
    public var uppercasedAtSentenceBoundary: String {
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
	
	/// EAKit: String decoded from base64 (if applicable).
	///
	///		"SGVsbG8gV29ybGQh".base64Decoded = Optional("Hello World!")
	///
	public var base64Decoded: String? {
		// https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
		guard let decodedData = Data(base64Encoded: self) else { return nil }
		return String(data: decodedData, encoding: .utf8)
	}
	
	/// EAKit: String encoded in base64 (if applicable).
	///
	///		"Hello World!".base64Encoded -> Optional("SGVsbG8gV29ybGQh")
	///
	public var base64Encoded: String? {
		// https://github.com/Reza-Rg/Base64-Swift-Extension/blob/master/Base64.swift
		let plainData = data(using: .utf8)
		return plainData?.base64EncodedString()
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
            return CFURLCreateStringByAddingPercentEscapes(nil, self as CFString?, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
        }
    }
    
    public var URLDecodedString: String {
        if #available(iOS 10.0, macOS 10.12, *) {
            if let esc = self.removingPercentEncoding {
                return esc
            }
            return self
        } else {
            return CFURLCreateStringByReplacingPercentEscapesUsingEncoding(nil, self as CFString?, "" as CFString?, CFStringBuiltInEncodings.UTF8.rawValue) as String
        }
    }
	
	/// EAKit: Array of characters of a string.
	///
	public var charactersArray: [Character] {
		return Array(self)
	}
	
	/// EAKit: CamelCase of string.
	///
	///		"sOme vAriable naMe".camelCased -> "someVariableName"
	///
	public var camelCased: String {
		let source = lowercased()
		let first = source[..<source.index(after: source.startIndex)]
		if source.contains(" ") {
			let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
			let camel = connected.replacingOccurrences(of: "\n", with: "")
			let rest = String(camel.dropFirst())
			return first + rest
		}
		let rest = String(source.dropFirst())
		return first + rest
	}
	
	/// EAKit: Check if string contains one or more emojis.
	///
	///		"Hello 😀".containEmoji -> true
	///
	public var containEmoji: Bool {
		// http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
		for scalar in unicodeScalars {
			switch scalar.value {
			case 0x3030, 0x00AE, 0x00A9, // Special Characters
			0x1D000...0x1F77F, // Emoticons
			0x2100...0x27BF, // Misc symbols and Dingbats
			0xFE00...0xFE0F, // Variation Selectors
			0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
				return true
			default:
				continue
			}
		}
		return false
	}
	
	/// EAKit: First character of string (if applicable).
	///
	///		"Hello".firstCharacterAsString -> Optional("H")
	///		"".firstCharacterAsString -> nil
	///
	public var firstCharacterAsString: String? {
		guard let first = self.first else { return nil }
		return String(first)
	}
	
	/// EAKit: Check if string contains one or more letters.
	///
	///		"123abc".hasLetters -> true
	///		"123".hasLetters -> false
	///
	public var hasLetters: Bool {
		return rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
	}
	
	/// EAKit: Check if string contains one or more numbers.
	///
	///		"abcd".hasNumbers -> false
	///		"123abc".hasNumbers -> true
	///
	public var hasNumbers: Bool {
		return rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
	}
	
	/// EAKit: Check if string contains only letters.
	///
	///		"abc".isAlphabetic -> true
	///		"123abc".isAlphabetic -> false
	///
	public var isAlphabetic: Bool {
		let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
		let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
		return hasLetters && !hasNumbers
	}
	
	/// EAKit: Check if string contains at least one letter and one number.
	///
	///		// useful for passwords
	///		"123abc".isAlphaNumeric -> true
	///		"abc".isAlphaNumeric -> false
	///
	public var isAlphaNumeric: Bool {
		let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
		let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
		let comps = components(separatedBy: .alphanumerics)
		return comps.joined(separator: "").count == 0 && hasLetters && hasNumbers
	}
	
	/// EAKit: Check if string is valid email format.
	///
	///		"john@doe.com".isEmail -> true
	///
	public var isEmail: Bool {
		// http://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift
		return matches(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
	}
	
	/// EAKit: Check if string is a valid URL.
	///
	///		"https://google.com".isValidUrl -> true
	///
	public var isValidUrl: Bool {
		return URL(string: self) != nil
	}
	
	/// EAKit: Check if string is a valid schemed URL.
	///
	///		"https://google.com".isValidSchemedUrl -> true
	///		"google.com".isValidSchemedUrl -> false
	///
	public var isValidSchemedUrl: Bool {
		guard let url = URL(string: self) else { return false }
		return url.scheme != nil
	}
	
	/// EAKit: Check if string is a valid https URL.
	///
	///		"https://google.com".isValidHttpsUrl -> true
	///
	public var isValidHttpsUrl: Bool {
		guard let url = URL(string: self) else { return false }
		return url.scheme == "https"
	}
	
	/// EAKit: Check if string is a valid http URL.
	///
	///		"http://google.com".isValidHttpUrl -> true
	///
	public var isValidHttpUrl: Bool {
		guard let url = URL(string: self) else { return false }
		return url.scheme == "http"
	}
	
	/// EAKit: Check if string is a valid file URL.
	///
	///		"file://Documents/file.txt".isValidFileUrl -> true
	///
	public var isValidFileUrl: Bool {
		return URL(string: self)?.isFileURL ?? false
	}
	
	/// EAKit: Check if string contains only numbers.
	///
	///		"123".isNumeric -> true
	///		"abc".isNumeric -> false
	///
	public var isNumeric: Bool {
		let hasLetters = rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
		let hasNumbers = rangeOfCharacter(from: .decimalDigits, options: .literal, range: nil) != nil
		return !hasLetters && hasNumbers
	}
	
	/// EAKit: Last character of string (if applicable).
	///
	///		"Hello".lastCharacterAsString -> Optional("o")
	///		"".lastCharacterAsString -> nil
	///
	public var lastCharacterAsString: String? {
		guard let last = self.last else { return nil }
		return String(last)
	}
	
	/// EAKit: Latinized string.
	///
	///		"Hèllö Wórld!".latinized -> "Hello World!"
	///
	public var latinized: String {
		return folding(options: .diacriticInsensitive, locale: Locale.current)
	}
	
	/// EAKit: Bool value from string (if applicable).
	///
	///		"1".bool -> true
	///		"False".bool -> false
	///		"Hello".bool = nil
	///
	public var bool: Bool? {
		let selfLowercased = trimmed.lowercased()
		if selfLowercased == "true" || selfLowercased == "1" {
			return true
		} else if selfLowercased == "false" || selfLowercased == "0" {
			return false
		}
		return nil
	}
	
	/// EAKit: Date object from "yyyy-MM-dd" formatted string.
	///
	///		"2007-06-29".date -> Optional(Date)
	///
	public var date: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd"
		return formatter.date(from: selfLowercased)
	}
	
	/// EAKit: Date object from "yyyy-MM-dd HH:mm:ss" formatted string.
	///
	///		"2007-06-29 14:23:09".dateTime -> Optional(Date)
	///
	public var dateTime: Date? {
		let selfLowercased = trimmed.lowercased()
		let formatter = DateFormatter()
		formatter.timeZone = TimeZone.current
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
		return formatter.date(from: selfLowercased)
	}
	
	/// EAKit: Integer value from string (if applicable).
	///
	///		"101".int -> 101
	///
	public var int: Int? {
		return Int(self)
	}
	
	/// EAKit: Lorem ipsum string of given length.
	///
	/// - Parameter length: number of characters to limit lorem ipsum to (default is 445 - full lorem ipsum).
	/// - Returns: Lorem ipsum dolor sit amet... string.
	public static func loremIpsum(ofLength length: Int = 445) -> String {
		guard length > 0 else { return "" }
		
		// https://www.lipsum.com/
		let loremIpsum = """
		Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
		"""
		if loremIpsum.count > length {
			return String(loremIpsum[loremIpsum.startIndex..<loremIpsum.index(loremIpsum.startIndex, offsetBy: length)])
		}
		return loremIpsum
	}
	
	/// EAKit: URL from string (if applicable).
	///
	///		"https://google.com".url -> URL(string: "https://google.com")
	///		"not url".url -> nil
	///
	public var url: URL? {
		return URL(string: self)
	}
	
	/// EAKit: String with no spaces or new lines in beginning and end.
	///
	///		"   hello  \n".trimmed -> "hello"
	///
	public var trimmed: String {
		return trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
	/// EAKit: Readable string from a URL string.
	///
	///		"it's%20easy%20to%20decode%20strings".urlDecoded -> "it's easy to decode strings"
	///
	public var urlDecoded: String {
		return removingPercentEncoding ?? self
	}
	
	/// EAKit: URL escaped string.
	///
	///		"it's easy to encode strings".urlEncoded -> "it's%20easy%20to%20encode%20strings"
	///
	public var urlEncoded: String {
		return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
	}
	
	/// EAKit: String without spaces and new lines.
	///
	///		"   \n Swifter   \n  Swift  ".withoutSpacesAndNewLines -> "EAKit"
	///
	public var withoutSpacesAndNewLines: String {
		return replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "\n", with: "")
	}
	
    /// EAKit: Check if the given string contains only white spaces
    public var isWhitespace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

// MARK: - Substring
public extension String {
    public func substring(toMax index: Int) -> String {
        if index <= 0 { return "" }
        if index >= self.count { return self }
        return (self as NSString).substring(to: index)
    }
    
    public func substring(fromMin index: Int) -> String {
        if index <= 0 { return "" }
        if index >= self.count { return "" }
        return (self as NSString).substring(from: index)
    }
    
    public func substring(with range: CountableClosedRange<Int>) -> String {
        let min = (range.lowerBound < 0) ? 0 : range.lowerBound
        let max = (range.upperBound >= self.count) ? self.count : range.upperBound
        return (self as NSString).substring(with: NSRange.init(location: min, length: max - min))
    }
}

// MARK: - Methods
public extension String {
	
	/// Float value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional Float value from given string.
	public func float(locale: Locale = .current) -> Float? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self) as? Float
	}
	
	/// Double value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional Double value from given string.
	public func double(locale: Locale = .current) -> Double? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self) as? Double
	}
	
	/// CGFloat value from string (if applicable).
	///
	/// - Parameter locale: Locale (default is Locale.current)
	/// - Returns: Optional CGFloat value from given string.
	public func cgFloat(locale: Locale = .current) -> CGFloat? {
		let formatter = NumberFormatter()
		formatter.locale = locale
		formatter.allowsFloats = true
		return formatter.number(from: self) as? CGFloat
	}
	
	/// EAKit: Array of strings separated by new lines.
	///
	///		"Hello\ntest".lines() -> ["Hello", "test"]
	///
	/// - Returns: Strings separated by new lines.
	public func lines() -> [String] {
		var result = [String]()
		enumerateLines { line, _ in
			result.append(line)
		}
		return result
	}
	
	/// EAKit: Returns a localized string, with an optional comment for translators.
	///
	///        "Hello world".localized -> Hallo Welt
	///
	public func localized(comment: String = "") -> String {
		return NSLocalizedString(self, comment: comment)
	}
	
	/// EAKit: The most common character in string.
	///
	///		"This is a test, since e is appearing everywhere e should be the common character".mostCommonCharacter() -> "e"
	///
	/// - Returns: The most common character.
	public func mostCommonCharacter() -> Character? {
		let mostCommon = withoutSpacesAndNewLines.reduce(into: [Character: Int]()) {
			let count = $0[$1] ?? 0
			$0[$1] = count + 1
			}.max { $0.1 < $1.1 }?.0
		
		return mostCommon
	}
	
	/// EAKit: Array with unicodes for all characters in a string.
	///
	///		"EAKit".unicodeArray -> [83, 119, 105, 102, 116, 101, 114, 83, 119, 105, 102, 116]
	///
	/// - Returns: The unicodes for all characters in a string.
	public func unicodeArray() -> [Int] {
		return unicodeScalars.map({ $0.hashValue })
	}
	
	/// EAKit: an array of all words in a string
	///
	///		"Swift is amazing".words() -> ["Swift", "is", "amazing"]
	///
	/// - Returns: The words contained in a string.
	public func words() -> [String] {
		// https://stackoverflow.com/questions/42822838
		let chararacterSet = CharacterSet.whitespacesAndNewlines.union(.punctuationCharacters)
		let comps = components(separatedBy: chararacterSet)
		return comps.filter { !$0.isEmpty }
	}
	
	/// EAKit: Count of words in a string.
	///
	///		"Swift is amazing".wordsCount() -> 3
	///
	/// - Returns: The count of words contained in a string.
	public func wordCount() -> Int {
		// https://stackoverflow.com/questions/42822838
		return words().count
	}
	
	/// EAKit: Safely subscript string with index.
	///
	///		"Hello World!"[3] -> "l"
	///		"Hello World!"[20] -> nil
	///
	/// - Parameter i: index.
	public subscript(safe i: Int) -> Character? {
		guard i >= 0 && i < count else { return nil }
		return self[index(startIndex, offsetBy: i)]
	}
	
	/// EAKit: Safely subscript string within a half-open range.
	///
	///		"Hello World!"[6..<11] -> "World"
	///		"Hello World!"[21..<110] -> nil
	///
	/// - Parameter range: Half-open range.
	public subscript(safe range: CountableRange<Int>) -> String? {
		guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
		guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) else { return nil }
		return String(self[lowerIndex..<upperIndex])
	}
	
	/// EAKit: Safely subscript string within a closed range.
	///
	///		"Hello World!"[6...11] -> "World!"
	///		"Hello World!"[21...110] -> nil
	///
	/// - Parameter range: Closed range.
	public subscript(safe range: ClosedRange<Int>) -> String? {
		guard let lowerIndex = index(startIndex, offsetBy: max(0, range.lowerBound), limitedBy: endIndex) else { return nil }
		guard let upperIndex = index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) else { return nil }
		return String(self[lowerIndex..<upperIndex])
	}
	
	#if os(iOS) || os(macOS)
	/// EAKit: Copy string to global pasteboard.
	///
	///		"SomeText".copyToPasteboard() // copies "SomeText" to pasteboard
	///
	public func copyToPasteboard() {
		#if os(iOS)
			UIPasteboard.general.string = self
		#elseif os(macOS)
			NSPasteboard.general.clearContents()
			NSPasteboard.general.setString(self, forType: .string)
		#endif
	}
	#endif
	
	/// EAKit: Converts string format to CamelCase.
	///
	///		var str = "sOme vaRiabLe Name"
	///		str.camelize()
	///		print(str) // prints "someVariableName"
	///
	public mutating func camelize() {
		self = camelCased
	}
	
	/// EAKit: Check if string contains only unique characters.
	///
	public func hasUniqueCharacters() -> Bool {
		guard count > 0 else { return false }
		var uniqueChars = Set<String>()
		for char in self {
			if uniqueChars.contains(String(char)) { return false }
			uniqueChars.insert(String(char))
		}
		return true
	}
	
	/// EAKit: Check if string contains one or more instance of substring.
	///
	///		"Hello World!".contain("O") -> false
	///		"Hello World!".contain("o", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string contains one or more instance of substring.
	public func contains(_ string: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return range(of: string, options: .caseInsensitive) != nil
		}
		return range(of: string) != nil
	}
	
	/// EAKit: Count of substring in string.
	///
	///		"Hello World!".count(of: "o") -> 2
	///		"Hello World!".count(of: "L", caseSensitive: false) -> 3
	///
	/// - Parameters:
	///   - string: substring to search for.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: count of appearance of substring in string.
	public func count(of string: String, caseSensitive: Bool = true) -> Int {
		if !caseSensitive {
			return lowercased().components(separatedBy: string.lowercased()).count - 1
		}
		return components(separatedBy: string).count - 1
	}
	
	/// EAKit: Check if string ends with substring.
	///
	///		"Hello World!".ends(with: "!") -> true
	///		"Hello World!".ends(with: "WoRld!", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - suffix: substring to search if string ends with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string ends with substring.
	public func ends(with suffix: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return lowercased().hasSuffix(suffix.lowercased())
		}
		return hasSuffix(suffix)
	}
	
	/// EAKit: Latinize string.
	///
	///		var str = "Hèllö Wórld!"
	///		str.latinize()
	///		print(str) // prints "Hello World!"
	///
	public mutating func latinize() {
		self = latinized
	}
	
	/// EAKit: Random string of given length.
	///
	///		String.random(ofLength: 18) -> "u7MMZYvGo9obcOcPj8"
	///
	/// - Parameter length: number of characters in string.
	/// - Returns: random string of given length.
	public static func random(ofLength length: Int) -> String {
		guard length > 0 else { return "" }
		let base = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		var randomString = ""
		for _ in 1...length {
			let randomIndex = arc4random_uniform(UInt32(base.count))
			let randomCharacter = base.charactersArray[Int(randomIndex)]
			randomString.append(randomCharacter)
		}
		return randomString
	}
	
	/// EAKit: Reverse string.
	public mutating func reverse() {
		let chars: [Character] = reversed()
		self = String(chars)
	}
	
	/// EAKit: Sliced string from a start index with length.
	///
	///        "Hello World".slicing(from: 6, length: 5) -> "World"
	///
	/// - Parameters:
	///   - i: string index the slicing should start from.
	///   - length: amount of characters to be sliced after given index.
	/// - Returns: sliced substring of length number of characters (if applicable) (example: "Hello World".slicing(from: 6, length: 5) -> "World")
	public func slicing(from i: Int, length: Int) -> String? {
		guard length >= 0, i >= 0, i < count  else { return nil }
		guard i.advanced(by: length) <= count else {
			return self[safe: i..<count]
		}
		guard length > 0 else { return "" }
		return self[safe: i..<i.advanced(by: length)]
	}
	
	/// EAKit: Slice given string from a start index with length (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(from: 6, length: 5)
	///		print(str) // prints "World"
	///
	/// - Parameters:
	///   - i: string index the slicing should start from.
	///   - length: amount of characters to be sliced after given index.
	public mutating func slice(from i: Int, length: Int) {
		if let str = self.slicing(from: i, length: length) {
			self = String(str)
		}
	}
	
	/// EAKit: Slice given string from a start index to an end index (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(from: 6, to: 11)
	///		print(str) // prints "World"
	///
	/// - Parameters:
	///   - start: string index the slicing should start from.
	///   - end: string index the slicing should end at.
	public mutating func slice(from start: Int, to end: Int) {
		guard end >= start else { return }
		if let str = self[safe: start..<end] {
			self = str
		}
	}
	
	/// EAKit: Slice given string from a start index (if applicable).
	///
	///		var str = "Hello World"
	///		str.slice(at: 6)
	///		print(str) // prints "World"
	///
	/// - Parameter i: string index the slicing should start from.
	public mutating func slice(at i: Int) {
		guard i < count else { return }
		if let str = self[safe: i..<count] {
			self = str
		}
	}
	
	/// EAKit: Check if string starts with substring.
	///
	///		"hello World".starts(with: "h") -> true
	///		"hello World".starts(with: "H", caseSensitive: false) -> true
	///
	/// - Parameters:
	///   - suffix: substring to search if string starts with.
	///   - caseSensitive: set true for case sensitive search (default is true).
	/// - Returns: true if string starts with substring.
	public func starts(with prefix: String, caseSensitive: Bool = true) -> Bool {
		if !caseSensitive {
			return lowercased().hasPrefix(prefix.lowercased())
		}
		return hasPrefix(prefix)
	}
	
	/// EAKit: Date object from string of date format.
	///
	///		"2017-01-15".date(withFormat: "yyyy-MM-dd") -> Date set to Jan 15, 2017
	///		"not date string".date(withFormat: "yyyy-MM-dd") -> nil
	///
	/// - Parameter format: date format.
	/// - Returns: Date object from string (if applicable).
	public func date(withFormat format: String) -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		return dateFormatter.date(from: self)
	}
	
	/// EAKit: Removes spaces and new lines in beginning and end of string.
	///
	///		var str = "  \n Hello World \n\n\n"
	///		str.trim()
	///		print(str) // prints "Hello World"
	///
	public mutating func trim() {
		self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
	}
	
	/// EAKit: Truncate string (cut it to a given number of characters).
	///
	///		var str = "This is a very long sentence"
	///		str.truncate(toLength: 14)
	///		print(str) // prints "This is a very..."
	///
	/// - Parameters:
	///   - toLength: maximum number of characters before cutting.
	///   - trailing: string to add at the end of truncated string (default is "...").
	public mutating func truncate(toLength length: Int, trailing: String? = "...") {
		guard length > 0 else { return }
		if count > length {
			self = self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
		}
	}
	
	/// EAKit: Truncated string (limited to a given number of characters).
	///
	///		"This is a very long sentence".truncated(toLength: 14) -> "This is a very..."
	///		"Short sentence".truncated(toLength: 14) -> "Short sentence"
	///
	/// - Parameters:
	///   - toLength: maximum number of characters before cutting.
	///   - trailing: string to add at the end of truncated string.
	/// - Returns: truncated string (this is an extr...).
	public func truncated(toLength length: Int, trailing: String? = "...") -> String {
		guard 1..<count ~= length else { return self }
		return self[startIndex..<index(startIndex, offsetBy: length)] + (trailing ?? "")
	}
	
	/// EAKit: Convert URL string to readable string.
	///
	///		var str = "it's%20easy%20to%20decode%20strings"
	///		str.urlDecode()
	///		print(str) // prints "it's easy to decode strings"
	///
	public mutating func urlDecode() {
		if let decoded = removingPercentEncoding {
			self = decoded
		}
	}
	
	/// EAKit: Escape string.
	///
	///		var str = "it's easy to encode strings"
	///		str.urlEncode()
	///		print(str) // prints "it's%20easy%20to%20encode%20strings"
	///
	public mutating func urlEncode() {
		if let encoded = addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
			self = encoded
		}
	}
	
	/// EAKit: Verify if string matches the regex pattern.
	///
	/// - Parameter pattern: Pattern to verify.
	/// - Returns: true if string matches the pattern.
	public func matches(pattern: String) -> Bool {
		return range(of: pattern,
					 options: String.CompareOptions.regularExpression,
					 range: nil, locale: nil) != nil
	}
	
	/// EAKit: Pad string to fit the length parameter size with another string in the start.
	///
	///   "hue".padStart(10) -> "       hue"
	///   "hue".padStart(10, with: "br") -> "brbrbrbhue"
	///
	/// - Parameter length: The target length to pad.
	/// - Parameter string: Pad string. Default is " ".
	public mutating func padStart(_ length: Int, with string: String = " ") {
		self = paddingStart(length, with: string)
	}
	
	/// EAKit: Returns a string by padding to fit the length parameter size with another string in the start.
	///
	///   "hue".paddingStart(10) -> "       hue"
	///   "hue".paddingStart(10, with: "br") -> "brbrbrbhue"
	///
	/// - Parameter length: The target length to pad.
	/// - Parameter string: Pad string. Default is " ".
	/// - Returns: The string with the padding on the start.
	public func paddingStart(_ length: Int, with string: String = " ") -> String {
		guard count < length else { return self }
		
		let padLength = length - count
		if padLength < string.count {
			return string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)] + self
		} else {
			var padding = string
			while padding.count < padLength {
				padding.append(string)
			}
			return padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)] + self
		}
	}
	
	/// EAKit: Pad string to fit the length parameter size with another string in the start.
	///
	///   "hue".padEnd(10) -> "hue       "
	///   "hue".padEnd(10, with: "br") -> "huebrbrbrb"
	///
	/// - Parameter length: The target length to pad.
	/// - Parameter string: Pad string. Default is " ".
	public mutating func padEnd(_ length: Int, with string: String = " ") {
		self = paddingEnd(length, with: string)
	}
	
	/// EAKit: Returns a string by padding to fit the length parameter size with another string in the end.
	///
	///   "hue".paddingEnd(10) -> "hue       "
	///   "hue".paddingEnd(10, with: "br") -> "huebrbrbrb"
	///
	/// - Parameter length: The target length to pad.
	/// - Parameter string: Pad string. Default is " ".
	/// - Returns: The string with the padding on the end.
	public func paddingEnd(_ length: Int, with string: String = " ") -> String {
		guard count < length else { return self }
		
		let padLength = length - count
		if padLength < string.count {
			return self + string[string.startIndex..<string.index(string.startIndex, offsetBy: padLength)]
		} else {
			var padding = string
			while padding.count < padLength {
				padding.append(string)
			}
			return self + padding[padding.startIndex..<padding.index(padding.startIndex, offsetBy: padLength)]
		}
	}
	
}

// MARK: - Operators
public extension String {
	
	/// EAKit: Repeat string multiple times.
	///
	///		'bar' * 3 -> "barbarbar"
	///
	/// - Parameters:
	///   - lhs: string to repeat.
	///   - rhs: number of times to repeat character.
	/// - Returns: new string with given string repeated n times.
	public static func * (lhs: String, rhs: Int) -> String {
		guard rhs > 0 else { return "" }
		return String(repeating: lhs, count: rhs)
	}
	
	/// EAKit: Repeat string multiple times.
	///
	///		3 * 'bar' -> "barbarbar"
	///
	/// - Parameters:
	///   - lhs: number of times to repeat character.
	///   - rhs: string to repeat.
	/// - Returns: new string with given string repeated n times.
	public static func * (lhs: Int, rhs: String) -> String {
		guard lhs > 0 else { return "" }
		return String(repeating: rhs, count: lhs)
	}
	
}

// MARK: - Initializers
public extension String {
	
	/// EAKit: Create a new string from a base64 string (if applicable).
	///
	///		String(base64: "SGVsbG8gV29ybGQh") = "Hello World!"
	///		String(base64: "hello") = nil
	///
	/// - Parameter base64: base64 string.
	public init?(base64: String) {
		guard let str = base64.base64Decoded else { return nil }
		self.init(str)
	}
	
	/// EAKit: Create a new random string of given length.
	///
	///		String(randomOfLength: 10) -> "gY8r3MHvlQ"
	///
	/// - Parameter length: number of characters in string.
	public init(randomOfLength length: Int) {
		self = String.random(ofLength: length)
	}
	
}

// MARK: - NSAttributedString extensions
public extension String {
	
	#if !os(tvOS) && !os(watchOS)
	/// EAKit: Bold string.
	public var bold: NSAttributedString {
		#if os(macOS)
			return NSMutableAttributedString(string: self, attributes: [.font: NSFont.boldSystemFont(ofSize: NSFont.systemFontSize)])
		#else
			return NSMutableAttributedString(string: self, attributes: [.font: UIFont.boldSystemFont(ofSize: UIFont.systemFontSize)])
		#endif
	}
	#endif
	
	/// EAKit: Underlined string
	public var underline: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
	}
	
	/// EAKit: Strikethrough string.
	public var strikethrough: NSAttributedString {
        return NSAttributedString(string: self, attributes: [.strikethroughStyle: NSNumber(value: NSUnderlineStyle.single.rawValue as Int)])
	}
	
	#if os(iOS)
	/// EAKit: Italic string.
	public var italic: NSAttributedString {
		return NSMutableAttributedString(string: self, attributes: [.font: UIFont.italicSystemFont(ofSize: UIFont.systemFontSize)])
	}
	#endif
	
	#if os(macOS)
	/// EAKit: Add color to string.
	///
	/// - Parameter color: text color.
	/// - Returns: a NSAttributedString versions of string colored with given color.
	public func colored(with color: NSColor) -> NSAttributedString {
		return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
	}
	#else
	/// EAKit: Add color to string.
	///
	/// - Parameter color: text color.
	/// - Returns: a NSAttributedString versions of string colored with given color.
	public func colored(with color: UIColor) -> NSAttributedString {
		return NSMutableAttributedString(string: self, attributes: [.foregroundColor: color])
	}
	#endif
	
}

// MARK: - NSString extensions
public extension String {
	
	/// EAKit: NSString from a string.
	public var nsString: NSString {
		return NSString(string: self)
	}
	
	/// EAKit: NSString lastPathComponent.
	public var lastPathComponent: String {
		return (self as NSString).lastPathComponent
	}
	
	/// EAKit: NSString pathExtension.
	public var pathExtension: String {
		return (self as NSString).pathExtension
	}
	
	/// EAKit: NSString deletingLastPathComponent.
	public var deletingLastPathComponent: String {
		return (self as NSString).deletingLastPathComponent
	}
	
	/// EAKit: NSString deletingPathExtension.
	public var deletingPathExtension: String {
		return (self as NSString).deletingPathExtension
	}
	
	/// EAKit: NSString pathComponents.
	public var pathComponents: [String] {
		return (self as NSString).pathComponents
	}
	
	/// EAKit: NSString appendingPathComponent(str: String)
	///
	/// - Parameter str: the path component to append to the receiver.
	/// - Returns: a new string made by appending aString to the receiver, preceded if necessary by a path separator.
	public func appendingPathComponent(_ str: String) -> String {
		return (self as NSString).appendingPathComponent(str)
	}
	
	/// EAKit: NSString appendingPathExtension(str: String)
	///
	/// - Parameter str: The extension to append to the receiver.
	/// - Returns: a new string made by appending to the receiver an extension separator followed by ext (if applicable).
	public func appendingPathExtension(_ str: String) -> String? {
		return (self as NSString).appendingPathExtension(str)
	}
	
}

public extension String {
    /// Remove double or more duplicated spaces.
    ///
    /// - returns: Remove double or more duplicated spaces.
    public func removeExtraSpaces() -> String {
        let squashed = self.replacingOccurrences(of: "[ ]+", with: " ", options: .regularExpression, range: nil)
        return squashed.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    /// Returns a new string in which all occurrences of a target strings in a specified range of the String are replaced by another given string.
    ///
    /// - Parameters:
    ///   - target: Target strings array.
    ///   - replacement: Replacement string.
    /// - Returns: Returns a new string in which all occurrences of a target strings in a specified range of the String are replaced by another given string.
    public func replacingOccurrences(of target: [String], with replacement: String) -> String {
        var string = self
        for occurrence in target {
            string = string.replacingOccurrences(of: occurrence, with: replacement)
        }
        
        return string
    }
    
    /// Count the number of lowercase characters.
    ///
    /// - Returns: Number of lowercase characters.
    public func countLowercasedCharacters() -> Int {
        var countChar = 0
        for i in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: i)) else {
                return 0
            }
            let isLowercase = CharacterSet.lowercaseLetters.contains(character)
            if isLowercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /// Count the number of uppercase characters.
    ///
    /// - Returns: Number of uppercase characters.
    public func countUppercasedCharacters() -> Int {
        var countChar = 0
        for i in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: i)) else {
                return 0
            }
            let isUppercase = CharacterSet.uppercaseLetters.contains(character)
            if isUppercase {
                countChar += 1
            }
        }
        
        return countChar
    }
    
    /// Count the number of numbers.
    ///
    /// - Returns: Number of numbers.
    public func countNumbers() -> Int {
        var countNumber = 0
        for i in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: i)) else {
                return 0
            }
            let isNumber = CharacterSet(charactersIn: "0123456789").contains(character)
            if isNumber {
                countNumber += 1
            }
        }
        
        return countNumber
    }
    
    /// Count the number of symbols.
    ///
    /// - Returns: Number of symbols.
    public func countSymbols() -> Int {
        var countSymbol = 0
        for i in 0 ..< self.length {
            guard let character = UnicodeScalar((NSString(string: self)).character(at: i)) else {
                return 0
            }
            let isSymbol = CharacterSet(charactersIn: "`~!?@#$€£¥§%^&*()_+-={}[]:\";.,<>'•\\|/").contains(character)
            if isSymbol {
                countSymbol += 1
            }
        }
        
        return countSymbol
    }
    
    /// Convert HEX string (separated by space) to "usual" characters string.
    /// Example: "68 65 6c 6c 6f" -> "hello".
    ///
    /// - Returns: Readable string.
    public func stringFromHEX() -> String {
        var hex = self
        hex = hex.replacingOccurrences(of: " ", with: "")
        var string: String = ""
        while !hex.isEmpty {
            let character: String = String(hex[..<hex.index(hex.startIndex, offsetBy: 2)])
            hex = String(hex[hex.index(hex.startIndex, offsetBy: 2)...])
            var characterInt: UInt32 = 0
            _ = Scanner(string: character).scanHexInt32(&characterInt)
            string += String(format: "%c", characterInt)
        }
        return string
    }
    
    /// Return if self is anagram of another String.
    ///
    /// - Parameter string: Other String.
    /// - Returns: Return true if self is anagram of another String, otherwise false.
    public func isAnagram(of string: String) -> Bool {
        let lowerSelf = self.lowercased().replacingOccurrences(of: " ", with: "")
        let lowerOther = string.lowercased().replacingOccurrences(of: " ", with: "")
        return lowerSelf.sorted() == lowerOther.sorted()
    }
    
    /// Returns if self is palindrome.
    ///
    /// - Returns: Returns true if self is palindrome, otherwise false.
    public func isPalindrome() -> Bool {
        let selfString = self.lowercased().replacingOccurrences(of: " ", with: "")
        let otherString = String(selfString.reversed())
        return selfString == otherString
    }
}

/// Password strength level enum, from 0 (min) to 6 (max).
///
/// - veryWeak:   Password strength very weak.
/// - weak:       Password strength weak.
/// - average:    Password strength average.
/// - strong:     Password strength strong.
/// - veryStrong: Password strength very strong.
/// - secure:     Password strength secure.
/// - verySecure: Password strength very secure.
public enum PasswordStrengthLevel: Int {
    case veryWeak
    case weak
    case average
    case strong
    case veryStrong
    case secure
    case verySecure
}

public extension String {
    public var strength: PasswordStrengthLevel {
        return Password.strength(password: self)
    }
    
    public var passwordStrengthLevel: PasswordStrengthLevel {
        return Password.strength(password: self)
    }
    
    public var score: Int {
        return Password.score(password: self)
    }
    
    public var passwordScore: Int {
        return Password.score(password: self)
    }
}

// MARK: - Password struct

/// This struct adds some useful functions to manage passwords.
public struct Password {
    // MARK: - Functions
    
    /// Check the password strength level.
    ///
    /// - Rarameter password: Password string.
    /// - Returns: Returns the password strength level with value from enum PasswordStrengthLevel.
    public static func strength(password: String) -> PasswordStrengthLevel {
        let score = self.score(password: password)
        switch score {
        case 1...49:
            return .veryWeak
        case 50...59:
            return .weak
        case 60...69:
            return .average
        case 70...79:
            return .strong
        case 80...89:
            return .veryStrong
        case 90...99:
            return .secure
        case 100...Int.max:
            return .verySecure
        default:
            return .veryWeak
        }
    }
    
    public static func score(password: String) -> Int {
        let score = self.lengthScore(password) + self.numbersScore(password) + self.symbolsScore(password) + self.lowercasedCharactersScore(password) + self.uppercasedCharactersScore(password)
        return score
    }
    
    /// Return the score based on password length.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on password length.
    private static func lengthScore(_ password: String) -> Int {
        let lenght = password.length
        
        switch lenght {
        case 1...4:
            return 5
        case 5...8:
            return 10
        case 9...Int.max:
            return 20
        default:
            return 0
        }
    }
    
    /// Return the score based on number of numbers in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of numbers in password.
    private static func numbersScore(_ password: String) -> Int {
        let numbers = password.countNumbers()
        
        switch numbers {
        case 1:
            return 10
        case 2:
            return 15
        case 3...Int.max:
            return 20
        default:
            return 0
        }
    }
    
    /// Return the score based on number of symbols in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of symbols in password.
    private static func symbolsScore(_ password: String) -> Int {
        let symbols = password.countSymbols()
        
        switch symbols {
        case 1:
            return 15
        case 2:
            return 20
        case 3...Int.max:
            return 25
        default:
            return 0
        }
    }
    
    /// Return the score based on number of lowercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of lowercased characters in password.
    private static func lowercasedCharactersScore(_ password: String) -> Int {
        let lowercasedCharacters = password.countLowercasedCharacters()
        
        switch lowercasedCharacters {
        case 1:
            return 5
        case 2:
            return 7
        case 3...Int.max:
            return 10
        default:
            return 0
        }
    }
    
    /// Return the score based on number of uppercased characters in password.
    ///
    /// - Parameter password: Password to be scored.
    /// - Returns: Return the score based on number of uppercased characters in password.
    private static func uppercasedCharactersScore(_ password: String) -> Int {
        let uppercasedCharacters = password.countUppercasedCharacters()
        
        switch uppercasedCharacters {
        case 1:
            return 10
        case 2:
            return 15
        case 3...Int.max:
            return 25
        default:
            return 0
        }
    }
}

public enum NATOPhoneticAlphabet: String {
    case alfa = "Alfa"
    case bravo = "Bravo"
    case charlie = "Charlie"
    case delta = "Delta"
    case echo = "Echo"
    case foxtrot = "Foxtrot"
    case golf = "Golf"
    case hotel = "Hotel"
    case india = "India"
    case juliett = "Juliett"
    case kilo = "Kilo"
    case lima = "Lima"
    case mike = "Mike"
    case november = "November"
    case oscar = "Oscar"
    case papa = "Papa"
    case quebec = "Quebec"
    case romeo = "Romeo"
    case sierra = "Sierra"
    case tango = "Tango"
    case uniform = "Uniform"
    case victor = "Victor"
    case whiskey = "Whiskey"
    case xray = "Xray"
    case yankee = "Yankee"
    case zulu = "Zulu"
    
    public static let allAlphabets: [NATOPhoneticAlphabet] = [
        .alfa, .bravo, .charlie, .delta, .echo, .foxtrot, .golf, .hotel, .india, .juliett, .kilo, .lima, .mike, .november, .oscar, .papa, .quebec, .romeo, .sierra, .tango, .uniform, .victor, .whiskey, .xray, .yankee, .zulu
    ]
    
    public init?(englishPhoneticAlphabet epa: String) {
        guard epa.count == 1 else {
            return nil
        }
        switch epa.uppercased() {
        case "A":
            self = .alfa
        case "B":
            self = .bravo
        case "C":
            self = .charlie
        case "D":
            self = .delta
        case "E":
            self = .echo
        case "F":
            self = .foxtrot
        case "G":
            self = .golf
        case "H":
            self = .hotel
        case "I":
            self = .india
        case "J":
            self = .juliett
        case "K":
            self = .kilo
        case "L":
            self = .lima
        case "M":
            self = .mike
        case "N":
            self = .november
        case "O":
            self = .oscar
        case "P":
            self = .papa
        case "Q":
            self = .quebec
        case "R":
            self = .romeo
        case "S":
            self = .sierra
        case "T":
            self = .tango
        case "U":
            self = .uniform
        case "V":
            self = .victor
        case "W":
            self = .whiskey
        case "X":
            self = .xray
        case "Y":
            self = .yankee
        case "Z":
            self = .zulu
        default: return nil
        }
    }
    
    public var englishPhoneticAlphabet: String {
        switch self {
        case .alfa: return "A"
        case .bravo: return "B"
        case .charlie: return "C"
        case .delta: return "D"
        case .echo: return "E"
        case .foxtrot: return "F"
        case .golf: return "G"
        case .hotel: return "H"
        case .india: return "I"
        case .juliett: return "J"
        case .kilo: return "K"
        case .lima: return "L"
        case .mike: return "M"
        case .november: return "N"
        case .oscar: return "O"
        case .papa: return "P"
        case .quebec: return "Q"
        case .romeo: return "R"
        case .sierra: return "S"
        case .tango: return "T"
        case .uniform: return "U"
        case .victor: return "V"
        case .whiskey: return "W"
        case .xray: return "X"
        case .yankee: return "Y"
        case .zulu: return "Z"
        }
    }
}
