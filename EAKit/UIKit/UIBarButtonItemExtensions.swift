//
//  UIBarButtonItemExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 08/12/2016.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UIBarButtonItem {
	
	/// EAKit: Add Target to UIBarButtonItem
	///
	/// - Parameters:
	///   - target: target.
	///   - action: selector to run when button is tapped.
	public func addTargetForAction(_ target: AnyObject, action: Selector) {
		self.target = target
		self.action = action
	}
	
}
#endif
