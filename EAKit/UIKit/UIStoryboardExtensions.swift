//
//  UIStoryboardExtensions.swift
//  EAKit
//
//  Created by Steven on 2/6/17.
//  Copyright © 2017 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - Methods
public extension UIStoryboard {
	
	/// EAKit: Get main storyboard for application
	public static var mainStoryboard: UIStoryboard? {
		let bundle = Bundle.main
		guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else { return nil }
		return UIStoryboard(name: name, bundle: bundle)
	}
	
	/// EAKit: Instantiate a UIViewController using its class name
	///
	/// - Parameter name: UIViewController type
	/// - Returns: The view controller corresponding to specified class name
	public func instantiate<T: UIViewController>(withClass name: T.Type) -> T? {
		return self.instantiateViewController(withIdentifier: String(describing: name)) as? T
	}
	
}
#endif
