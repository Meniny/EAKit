//
//  Operator-Generic.swift
//  Pods
//
//  Created by Meniny on 2017-05-16.
//
//

import Foundation

prefix operator !~
infix operator =>

//postfix operator ~
//postfix operator ~=

/// return true if T is not equal to nil
public prefix func !~ <T> (rhs: T?) -> Bool {
    return rhs != nil
}

// convert lhs to rhs's type
public func => <T1, T2> (lhs: T1, rhs: T2) -> T2? {
    return lhs as? T2
}
