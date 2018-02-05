//
//  UITextViewExtensions.swift
//  EAKit
//
//  Created by Omar Albeik on 9/28/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UITextView {
	
	/// EAKit: Clear text.
	public func clear() {
		text = ""
		attributedText = NSAttributedString(string: "")
	}
	
	/// EAKit: Scroll to the bottom of text view
	public func scrollToBottom() {
		let range = NSMakeRange((text as NSString).length - 1, 1)
		scrollRangeToVisible(range)
		
	}
	
	/// EAKit: Scroll to the top of text view
	public func scrollToTop() {
		let range = NSMakeRange(0, 1)
		scrollRangeToVisible(range)
	}
	
}
#endif