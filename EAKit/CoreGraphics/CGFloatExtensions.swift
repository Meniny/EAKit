//
//  CGFloatExtensions.swift
//  EAKit
//
//  Created by Omar Albeik on 8/23/16.
//  Copyright © 2016 EAKit
//

#if os(macOS)
	import Cocoa
#else
	import UIKit
#endif

// MARK: - Properties
public extension CGFloat {
	
	/// EAKit: Absolute of CGFloat value.
	public var abs: CGFloat {
		return Swift.abs(self)
	}
	
	/// EAKit: Ceil of CGFloat value.
	public var ceil: CGFloat {
		return Foundation.ceil(self)
	}
	
	/// EAKit: Radian value of degree input.
	public var degreesToRadians: CGFloat {
		return CGFloat.pi * self / 180.0
	}
	
	/// EAKit: Floor of CGFloat value.
	public var floor: CGFloat {
		return Foundation.floor(self)
	}
	
	/// EAKit: Check if CGFloat is positive.
	public var isPositive: Bool {
		return self > 0
	}
	
	/// EAKit: Check if CGFloat is negative.
	public var isNegative: Bool {
		return self < 0
	}
	
	/// EAKit: Int.
	public var int: Int {
		return Int(self)
	}
	
	/// EAKit: Float.
	public var float: Float {
		return Float(self)
	}
	
	/// EAKit: Double.
	public var double: Double {
		return Double(self)
	}
	
	/// EAKit: Degree value of radian input.
	public var radiansToDegrees: CGFloat {
		return self * 180 / CGFloat.pi
	}
	
}

// MARK: - Methods
public extension CGFloat {
	
	/// EAKit: Random CGFloat between two CGFloat values.
	///
	/// - Parameters:
	///   - min: minimum number to start random from.
	///   - max: maximum number random number end before.
	/// - Returns: random CGFloat between two CGFloat values.
	public static func randomBetween(min: CGFloat, max: CGFloat) -> CGFloat {
		let delta = max - min
		return min + CGFloat(arc4random_uniform(UInt32(delta)))
	}
	
}
