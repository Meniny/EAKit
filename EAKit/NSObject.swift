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

public func stringify(_ cls: AnyClass) -> String {
    return "\(type(of: cls))".components(separatedBy: ".").first ?? ""
}

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

