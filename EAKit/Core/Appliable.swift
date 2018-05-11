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
}

extension NSObject: Appliable {}
