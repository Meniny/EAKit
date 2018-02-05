//
//  DoubleExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/6/16.
//  Copyright © 2016 EAKit
//

import CoreGraphics

// MARK: - Properties
public extension Double {
	
	/// EAKit: Int.
	public var int: Int {
		return Int(self)
	}
	
	/// EAKit: Float.
	public var float: Float {
		return Float(self)
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
///   - lhs: base double.
///   - rhs: exponent double.
/// - Returns: exponentiation result (example: 4.4 ** 0.5 = 2.0976176963).
public func ** (lhs: Double, rhs: Double) -> Double {
	// http://nshipster.com/swift-operators/
	return pow(lhs, rhs)
}

prefix operator √
/// EAKit: Square root of double.
///
/// - Parameter double: double value to find square root for.
/// - Returns: square root of given double.
public prefix func √ (double: Double) -> Double {
	// http://nshipster.com/swift-operators/
	return sqrt(double)
}
