//
//  NSObject.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public static var identifierString: String {
        return NSStringFromClass(self.classForCoder())
    }
    
    public class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

public extension NSObjectProtocol {
    public var describedProperty: String {
        let mirror = Mirror(reflecting: self)
        return mirror.children.map { element -> String in
            let key = element.label ?? "Unknown"
            let value = element.value
            return "\(key): \(value)"
            }
            .joined(separator: "\n")
    }
}

