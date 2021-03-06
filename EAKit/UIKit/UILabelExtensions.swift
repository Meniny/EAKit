//
//  UILabelExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 9/23/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UILabel {
	
	/// EAKit: Initialize a UILabel with text
	public convenience init(text: String?) {
		self.init()
		self.text = text
	}
	
	/// EAKit: Required height for a label
	public var requiredHeight: CGFloat {
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
		label.numberOfLines = 0
		label.lineBreakMode = NSLineBreakMode.byWordWrapping
		label.font = font
		label.text = text
		label.attributedText = attributedText
		label.sizeToFit()
		return label.frame.height
	}
	
}
#endif
