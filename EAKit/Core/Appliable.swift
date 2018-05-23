//
//  Appliable.swift
//  Pods
//
//  Created by Meniny on 2018-05-12.
//

import Foundation

public protocol Appliable {}

public extension Appliable {
    @discardableResult
    public func apply(closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
    
    @discardableResult
    public static func apply(_ items: Array<Self>, closure: (Self) -> Void) -> Array<Self> {
        return items.apply(closure: closure)
    }
    
    @discardableResult
    public static func apply(_ items: Self..., closure: (Self) -> Void) -> Array<Self> {
        return apply(items, closure: closure)
    }
}

public extension Array where Element: Appliable {
    @discardableResult
    public func apply(closure: (Element) -> Void) -> Array<Element> {
        forEach(closure)
        return self
    }
}

extension NSObject: Appliable {}

extension Dictionary: Appliable {}
extension Array: Appliable {}

extension Bool: Appliable {}
extension String: Appliable {}
extension CGFloat: Appliable {}
extension CGImage: Appliable {}
extension Float: Appliable {}
extension Double: Appliable {}

extension Int: Appliable {}
extension Int8: Appliable {}
extension Int16: Appliable {}
extension Int32: Appliable {}
extension Int64: Appliable {}

extension UInt: Appliable {}
extension UInt8: Appliable {}
extension UInt16: Appliable {}
extension UInt32: Appliable {}
extension UInt64: Appliable {}


