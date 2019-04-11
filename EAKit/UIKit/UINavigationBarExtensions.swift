//
//  UINavigationBarExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/22/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UINavigationBar {
	
	/// EAKit: Set Navigation Bar title, title color and font.
	///
	/// - Parameters:
	///   - font: title font
	///   - color: title text color (default is .black).
	public func setTitleFont(_ font: UIFont, color: UIColor = .black) {
		var attrs = [NSAttributedString.Key: Any]()
		attrs[.font] = font
		attrs[.foregroundColor] = color
		titleTextAttributes = attrs
	}
	
	/// EAKit: Make navigation bar transparent.
	///
	/// - Parameter tint: tint color (default is .white).
	public func makeTransparent(withTint tint: UIColor = .white) {
		isTranslucent = true
		backgroundColor = .clear
		barTintColor = .clear
		setBackgroundImage(UIImage(), for: .default)
		tintColor = tint
		titleTextAttributes = [.foregroundColor: tint]
		shadowImage = UIImage()
	}
	
	/// EAKit: Set navigationBar background and text colors
	///
	/// - Parameters:
	///   - background: backgound color
	///   - text: text color
	public func setColors(background: UIColor, text: UIColor) {
		isTranslucent = false
		backgroundColor = background
		barTintColor = background
		setBackgroundImage(UIImage(), for: .default)
		tintColor = text
		titleTextAttributes = [.foregroundColor: text]
	}
	
}
#endif
