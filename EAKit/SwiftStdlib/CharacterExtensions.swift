//
//  CharacterExtensions.swift
//  EAKit
//
//  Created by Omar Albeik on 8/8/16.
//  Copyright © 2016 EAKit
//

// MARK: - Properties
public extension Character {
	
	/// EAKit: Check if character is emoji.
	///
	///		Character("😀").isEmoji -> true
	///
	public var isEmoji: Bool {
		// http://stackoverflow.com/questions/30757193/find-out-if-character-in-string-is-emoji
		let scalarValue = String(self).unicodeScalars.first!.value
		switch scalarValue {
		case 0x3030, 0x00AE, 0x00A9, // Special Characters
		0x1D000...0x1F77F, // Emoticons
		0x2100...0x27BF, // Misc symbols and Dingbats
		0xFE00...0xFE0F, // Variation Selectors
		0x1F900...0x1F9FF: // Supplemental Symbols and Pictographs
			return true
		default:
			return false
		}
	}
	
	/// EAKit: Check if character is number.
	///
	///		Character("1").isNumber -> true
	///		Character("a").isNumber -> false
	///
	public var isNumber: Bool {
		return Int(String(self)) != nil
	}
	
	/// EAKit: Check if character is a letter.
	///
	///		Character("4").isLetter -> false
	///		Character("a").isLetter -> true
	///
	public var isLetter: Bool {
		return String(self).rangeOfCharacter(from: .letters, options: .numeric, range: nil) != nil
	}
	
	/// EAKit: Check if character is uppercased.
	///
	///		Character("a").isUppercased -> false
	///		Character("A").isUppercased -> true
	///
	public var isUppercased: Bool {
		return String(self) == String(self).uppercased()
	}
	
	/// EAKit: Check if character is lowercased.
	///
	///		Character("a").isLowercased -> true
	///		Character("A").isLowercased -> false
	///
	public var isLowercased: Bool {
		return String(self) == String(self).lowercased()
	}
	
	/// EAKit: Check if character is white space.
	///
	///		Character(" ").isWhiteSpace -> true
	///		Character("A").isWhiteSpace -> false
	///
	public var isWhiteSpace: Bool {
		return String(self) == " "
	}
	
	/// EAKit: Integer from character (if applicable).
	///
	///		Character("1").int -> 1
	///		Character("A").int -> nil
	///
	public var int: Int? {
		return Int(String(self))
	}
	
	/// EAKit: String from character.
	///
	///		Character("a").string -> "a"
	///
	public var string: String {
		return String(self)
	}
	
	/// EAKit: Return the character lowercased.
	///
	///		Character("A").lowercased -> Character("a")
	///
	public var lowercased: Character {
		return String(self).lowercased().first!
	}
	
	/// EAKit: Return the character uppercased.
	///
	///		Character("a").uppercased -> Character("A")
	///
	public var uppercased: Character {
		return String(self).uppercased().first!
	}
	
}

// MARK: - Operators
public extension Character {
	
	/// EAKit: Repeat character multiple times.
	///
	///		Character("-") * 10 -> "----------"
	///
	/// - Parameters:
	///   - lhs: character to repeat.
	///   - rhs: number of times to repeat character.
	/// - Returns: string with character repeated n times.
	public static func * (lhs: Character, rhs: Int) -> String {
		guard rhs > 0 else {
			return ""
		}
		return String(repeating: String(lhs), count: rhs)
	}
	
	/// EAKit: Repeat character multiple times.
	///
	///		10 * Character("-") -> "----------"
	///
	/// - Parameters:
	///   - lhs: number of times to repeat character.
	///   - rhs: character to repeat.
	/// - Returns: string with character repeated n times.
	public static func * (lhs: Int, rhs: Character) -> String {
		guard lhs > 0 else {
			return ""
		}
		return String(repeating: String(rhs), count: lhs)
	}
	
}

public extension CharacterSet {
    public static let urlQueryValueAllowed = CharacterSet(charactersIn: "&\"#%<>[]^`{|}=").inverted
}
