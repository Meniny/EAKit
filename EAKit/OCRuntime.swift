//
//  OCRuntime.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public struct Swizzler {
    
    public enum MethodKind {
        case instance
        case `class`
    }
    
    public static func swizzle(_ method: String,
                               cls: AnyClass,
                               prefix: String = "ea_swizzled",
                               kind: Swizzler.MethodKind = .instance) {
        let originalSelector = Selector(method)
        let swizzledSelector = Selector("\(prefix)_\(method)")
        
        let originalMethod = kind == .instance
            ? class_getInstanceMethod(cls, originalSelector)
            : class_getClassMethod(cls, originalSelector)
        
        let swizzledMethod = kind == .instance
            ? class_getInstanceMethod(cls, swizzledSelector)
            : class_getClassMethod(cls, swizzledSelector)
        
        let didAddMethod = class_addMethod(cls, originalSelector,
                                           method_getImplementation(swizzledMethod!),
                                           method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(cls, swizzledSelector,
                                method_getImplementation(originalMethod!),
                                method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}
