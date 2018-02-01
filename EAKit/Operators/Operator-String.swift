//
//  MXHelper-Operator.swift
//  Pods
//
//  Created by Meniny on 2017-05-09.
//
//

import Foundation

/// repeat string
public func * (lhs: String, rhs: Int) -> String {
    return lhs.repeating(rhs)
}

/// repeat string
public func *= (lhs: inout String, rhs: Int) {
    lhs.append(lhs.repeating(rhs - 1))
}

/// find and replace rhs in lhs
public func - (lhs: String, rhs: String) -> String {
    return lhs.replacingOccurrences(of: rhs, with: "")
}

/// find and replace rhs in lhs
public func -= (lhs: inout String, rhs: String) {
    lhs = lhs.replacingOccurrences(of: rhs, with: "")
}

/// reversed string
public prefix func ~ (lhs: String) -> String {
    return String(lhs.reversed())
}
