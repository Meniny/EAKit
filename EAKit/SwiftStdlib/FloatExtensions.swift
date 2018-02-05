//
//  FloatExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/8/16.
//  Copyright © 2016 EAKit
//

import CoreGraphics

// MARK: - Properties
public extension Float {
	
	/// EAKit: Int.
	public var int: Int {
		return Int(self)
	}
	
	/// EAKit: Double.
	public var double: Double {
		return Double(self)
	}
	
	/// EAKit: CGFloat.
	public var cgFloat: CGFloat {
		return CGFloat(self)
	}
	
}

// MARK: - Operators

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence
/// EAKit: Value of exponentiation.
///
/// - Parameters:
///   - lhs: base float.
///   - rhs: exponent float.
/// - Returns: exponentiation result (4.4 ** 0.5 = 2.0976176963).
public func ** (lhs: Float, rhs: Float) -> Float {
	// http://nshipster.com/swift-operators/
	return pow(lhs, rhs)
}

prefix operator √
/// EAKit: Square root of float.
///
/// - Parameter float: float value to find square root for
/// - Returns: square root of given float.
public prefix func √ (float: Float) -> Float {
	// http://nshipster.com/swift-operators/
	return sqrt(float)
}
