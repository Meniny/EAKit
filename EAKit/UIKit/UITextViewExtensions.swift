//
//  UITextViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 9/28/16.
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

#if os(iOS)
    public extension UITextView {
        /// EAKit: Automatically adds a toolbar with a done button to the top of the keyboard. Tapping the button will dismiss the keyboard.
        public func addDoneButton(_ barStyle: UIBarStyle = .default, title: String? = nil) {
            let keyboardToolbar = UIToolbar()
            keyboardToolbar.items = [
                UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
                UIBarButtonItem(title: NSLocalizedString(title ?? "Done", comment: ""), style: .done, target: self, action: #selector(resignFirstResponder))
            ]
            
            keyboardToolbar.barStyle = barStyle
            keyboardToolbar.sizeToFit()
            
            inputAccessoryView = keyboardToolbar
        }
    }
#endif
