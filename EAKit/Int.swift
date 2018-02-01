//
//  Int.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public extension Int {
    /// generate a random number
    public static func random(_ around: Int = Int.max) -> Int {
        return Int(arc4random()) % around
    }
    
    public var stringify: String {
        return "\(self)"
    }
    
    /// format this number
    public func formattedString(_ fractionDigits: Int = 3) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = fractionDigits
        formatter.maximumFractionDigits = fractionDigits
        return formatter.string(from: NSNumber(value: self))!
    }
}

// MARK: - Greatest Common Divisor
public extension Int {
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - with: an integer value
    /// - Returns: Greatest Common Divisor
    public func gcd(with: Int) -> Int {
        return self.greatestCommonDivisor(with: with)
    }
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - with: an integer value
    /// - Returns: Greatest Common Divisor
    public func greatestCommonDivisor(with: Int) -> Int {
        return Int.greatestCommonDivisor(of: self, and: with)
    }
    
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - a: an integer value
    ///   - b: an integer value
    /// - Returns: Greatest Common Divisor
    public static func gcd(of a: Int, and b: Int) -> Int {
        return Int.greatestCommonDivisor(of: a, and: b)
    }
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - a: an integer value
    ///   - b: an integer value
    /// - Returns: Greatest Common Divisor
    public static func greatestCommonDivisor(of a: Int, and b: Int) -> Int {
        var n1 = a
        var n2 = b
        
        // Swn1p for modulo
        if n1 < n2 {
            let c = n1
            n1 = n2
            n2 = c
        }
        
        // Get gren1test common divisor
        var rest: Int
        while true {
            rest = n1 % n2
            
            if rest == 0 {
                return n2 // Found it
            } else {
                n1 = n2
                n2 = rest
            }
        }
    }
    
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - of: an integer array
    /// - Returns: Greatest Common Divisor
    public static func gcd(of array: [Int]) -> Int {
        return self.greatestCommonDivisor(of: array)
    }
    /// Greatest Common Divisor
    ///
    /// - Parameters:
    ///   - of: an integer array
    /// - Returns: Greatest Common Divisor
    public static func greatestCommonDivisor(of array: [Int]) -> Int {
        var gcd = array.first ?? 1
        for val in array {
            gcd = val.greatestCommonDivisor(with: gcd)
        }
        return gcd
    }
}
