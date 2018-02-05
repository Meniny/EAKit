//
//  UINavigationControllerExtensions.swift
//  EAKit
//
//  Created by Omar Albeik on 8/6/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UINavigationController {
	
	/// EAKit: Pop ViewController with completion handler.
	///
	/// - Parameter completion: optional completion handler (default is nil).
	public func popViewController(_ completion: (() -> Void)? = nil) {
		// https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		popViewController(animated: true)
		CATransaction.commit()
	}
	
	/// EAKit: Push ViewController with completion handler.
	///
	/// - Parameters:
	///   - viewController: viewController to push.
	///   - completion: optional completion handler (default is nil).
	public func pushViewController(_ viewController: UIViewController, completion: (() -> Void)? = nil) {
		// https://github.com/cotkjaer/UserInterface/blob/master/UserInterface/UIViewController.swift
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		pushViewController(viewController, animated: true)
		CATransaction.commit()
	}
	
	/// EAKit: Make navigation controller's navigation bar transparent.
	///
	/// - Parameter tint: tint color (default is .white).
	public func makeTransparent(withTint tint: UIColor = .white) {
		navigationBar.setBackgroundImage(UIImage(), for: .default)
		navigationBar.shadowImage = UIImage()
		navigationBar.isTranslucent = true
		navigationBar.tintColor = tint
		navigationBar.titleTextAttributes = [.foregroundColor: tint]
	}
	
}
#endif
