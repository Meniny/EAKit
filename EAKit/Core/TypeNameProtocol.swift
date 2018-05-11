//
//  TypeNameProtocol.swift
//  Pods
//
//  Created by Meniny on 2018-05-12.
//

import Foundation

public protocol TypeNameProtocol {
    static var typeName: String { get }
    var typeName: String { get }
}

public extension TypeNameProtocol {
    public static var typeName: String {
        return String(describing: self)
    }
    
    public var typeName: String {
        return type(of: self).typeName
    }
}

extension NSObject: TypeNameProtocol {}
