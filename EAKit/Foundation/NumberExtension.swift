//
//  NumberExtension.swift
//  EAKit
//

import Foundation
import Dispatch

// MARK: - Global functions

/// Degrees to radians conversion.
///
/// - Parameter degrees: Degrees to be converted.
/// - Returns: Returns the convertion result.
public func degreesToRadians(_ degrees: Float) -> Float {
    return Float(Double(degrees) * Double.pi / 180)
}

/// Radians to degrees conversion.
///
/// - Parameter radians: Radians to be converted.
/// - Returns: Returns the convertion result.
public func radiansToDegrees(_ radians: Float) -> Float {
    return Float(Double(radians) * 180 / Double.pi)
}

/// Create a random integer between the given range.
///
/// - Parameters:
///   - minValue: Mininum random value. Default is 0.
///   - maxValue: Maxinum random value. Default is 1.
/// - Returns: Returns the created random integer.
public func randomInt(min minValue: Int = 0, max maxValue: Int = 100) -> Int {
    return randomInt(range: minValue...maxValue)
}

/// Create a random integer between the given range.
/// Example: randomInt(-500...100).
///
/// - Parameter range: Range random value.
/// - Returns: Returns the created random integer.
public func randomInt(range: ClosedRange<Int>) -> Int {
    return Int(randomFloat(range: Float(range.lowerBound)...Float(range.upperBound)) + 0.5)
}

/// Create a random float between the given range.
///
/// - Parameters:
///   - minValue: Mininum random value. Default is 0.
///   - maxValue: Maxinum random value. Default is 1.
/// - Returns: Returns the created random float.
public func randomFloat(min minValue: Float = 0, max maxValue: Float = 1) -> Float {
    return randomFloat(range: minValue...maxValue)
}

/// Create a random float between the given range.
/// Example: randomFloat(-500...100).
///
/// - Parameter range: Range random value.
/// - Returns: Returns the created random float.
public func randomFloat(range: ClosedRange<Float>) -> Float {
    return Float(range.upperBound - range.lowerBound) * abs(Float.random()) + Float(range.lowerBound)
}

// MARK: - Randomizer struct

/// Produces great cryptographically random numbers.
private struct Randomizer {
    #if os(Linux)
        /// /dev/urandom file reader.
        static let file = fopen("/dev/urandom", "r")!
    #endif
    /// Random queue.
    static let queue = DispatchQueue(label: "random")
    
    #if os(Linux)
        /// Get a random number of a given capacity.
        ///
        /// - Parameter count: Byte count.
        /// - Returns: Return the random number.
        static func get(count: Int) -> [Int8] {
            let capacity = count + 1
            var data = UnsafeMutablePointer<Int8>.allocate(capacity: capacity)
            defer {
                data.deallocate(capacity: capacity)
            }
            _ = queue.sync {
                fgets(data, Int32(capacity), file)
            }
    
            return Array(UnsafeMutableBufferPointer(start: data, count: count))
        }
    #else
        /// Get a random number of a given capacity.
        ///
        /// - Parameter count: Byte count.
        /// - Returns: Return the random number.
        static func get(count: Int) -> [UInt8] {
            let capacity = count + 1
            var data = UnsafeMutablePointer<UInt8>.allocate(capacity: capacity)
            var secure: Int32 = 0
            defer {
//                data.deallocate(capacity: capacity)
                data.deallocate()
            }
            _ = queue.sync {
                secure = SecRandomCopyBytes(kSecRandomDefault, capacity, data)
            }
            
            return secure == 0 ? Array(UnsafeMutableBufferPointer(start: data, count: count)) : [0]
        }
    #endif
}

// MARK: - Extensions

/// This extension adds some useful function to Numeric.
public extension Numeric {
    /// Creates a random integer number.
    ///
    /// - Returns: Returns the creates a random integer number.
    static func random() -> Self {
        let numbers = Randomizer.get(count: MemoryLayout<Self>.size)
        return numbers.withUnsafeBufferPointer { bufferPointer in
            return bufferPointer.baseAddress!.withMemoryRebound(to: Self.self, capacity: 1) {
                return $0.pointee
            }
        }
    }
}

/// This extesion adds some useful functions to Double.
public extension Double {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        return description.map { Int(String($0)) ?? 0 }
    }
    
    /// Creates a random Double number.
    ///
    /// - Returns: Returns the created a random Double number.
    static func random() -> Double {
        return Double(Int.random()) / Double(Int.max)
    }
}

/// This extesion adds some useful functions to Float.
public extension Float {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        return description.map { Int(String($0)) ?? 0 }
    }
    
    /// Creates a random Float number.
    ///
    /// - Returns: Returns the created a random Float number.
    static func random() -> Float {
        return Float(Double.random())
    }
}

/// This extesion adds some useful functions to Int.
public extension Int {
    /// Gets the individual numbers, and puts them into an array. All negative numbers will start with 0.
    var array: [Int] {
        return description.map { Int(String($0)) ?? 0 }
    }
}

/// Infix operator `<>` with ComparisonPrecedence.
infix operator <>: ComparisonPrecedence

/// Infix operator `<=>` with ComparisonPrecedence.
infix operator <=>: ComparisonPrecedence

/// Returns true if `left` it is in `right` range but not equal.
/// If you want to check if its even equal use the `<=>` operator.
///
/// - Parameters:
///   - left: Left number to be compared.
///   - right: Right tuple to be compared (Number, Number).
/// - Returns: Returns true if `left` it is in `right` range but not equal.
public func <> <T: Comparable>(left: T, right: (T, T)) -> Bool {
    return left > right.0 && left < right.1
}

/// Returns true if `left` is in `right` range or equal.
///
/// - Parameters:
///   - left: Left number to be compared.
///   - right: Right tuple to be compared (Number, Number).
/// - Returns: Returns true if `left` it is in `right` range or equal.
public func <=> <T: Comparable>(left: T, right: (T, T)) -> Bool {
    return left >= right.0 && left <= right.1
}
