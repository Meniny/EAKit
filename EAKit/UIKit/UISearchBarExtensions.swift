//
//  UISearchBarExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/23/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Properties
public extension UISearchBar {
	
	/// EAKit: Text field inside search bar (if applicable).
	public var textField: UITextField? {
		let subViews = subviews.flatMap { $0.subviews }
		guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
			return nil
		}
		return textField
	}
	
	/// EAKit: Text with no spaces or new lines in beginning and end (if applicable).
	public var trimmedText: String? {
		return text?.trimmingCharacters(in: .whitespacesAndNewlines)
	}
	
}

// MARK: - Methods
public extension UISearchBar {
	
	/// EAKit: Clear text.
	public func clear() {
		text = ""
	}
	
}
#endif
