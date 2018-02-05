//
//  UISwitchExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 08/12/2016.
//  Copyright © 2016 EAKit
//

#if os(iOS)
import UIKit

// MARK: - Methods
public extension UISwitch {
	
	/// EAKit: Toggle a UISwitch
	///
	/// - Parameter animated: set true to animate the change (default is true)
	public func toggle(animated: Bool = true) {
		setOn(!isOn, animated: animated)
	}
	
}
#endif
