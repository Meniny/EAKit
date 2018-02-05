//
//  LocalExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 4/19/17.
//  Copyright © 2017 EAKit
//

import Foundation

// MARK: - Properties
public extension Locale {
	
	/// EAKit: UNIX representation of locale usually used for normalizing.
	public static var posix: Locale {
		return Locale(identifier: "en_US_POSIX")
	}
	
}
