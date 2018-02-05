//
//  UIDatePickerExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 12/9/17.
//  Copyright © 2017 EAKit
//

#if os(iOS)
import UIKit

// MARK: - Properties
public extension UIDatePicker {
	
	/// EAKit: Text color of UIDatePicker.
	public var textColor: UIColor? {
		set {
			setValue(newValue, forKeyPath: "textColor")
		}
		get {
			return value(forKeyPath: "textColor") as? UIColor
		}
	}
	
}
#endif
