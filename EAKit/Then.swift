//
//  Then.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation
import CoreGraphics

// MARK: - Then
public protocol Then {}

public extension Then where Self: AnyObject {
    
    /// Makes it available to execute something with closures.
    ///
    /// Usage:
    ///
    ///     let aView = UIView().then {
    ///          $0.backgroundColor = UIColor.redColor()
    ///          $0.translatesAutoresizingMaskIntoConstraints = false
    ///     }
    ///
    /// - Parameter closure: closure
    /// - Returns: self
    public func then(_ closure: (Self) -> Swift.Void) -> Self {
        closure(self)
        return self
    }
}

public extension Then where Self: Any {
    
    /// Makes it available to execute something with closures.
    ///
    /// Usage:
    ///
    ///     let frame = CGRect().then {
    ///          $0.origin.x = 10
    ///          $0.size.width = 100
    ///     }
    ///
    /// - Parameter closure: closure
    /// - Returns: self
    public func then( _ closure: (inout Self) -> Swift.Void) -> Self {
        var cp = self
        closure(&cp)
        return cp
    }
    
    /// Makes it available to execute something with closures.
    ///
    /// Usage:
    ///
    ///     UserDefaults.standard.do {
    ///          $0.set("Elias", forKey: "username")
    ///          $0.set("meniny@qq.com", forKey: "email")
    ///          $0.synchronize()
    ///     }
    ///
    /// - Parameter closure: closure
    public func `do`(_ closure: (Self) -> Swift.Void) {
        closure(self)
    }
}

extension NSObject: Then {}

#if !os(watchOS)
    extension CGPoint: Then {}
    extension CGRect: Then {}
    extension CGSize: Then {}
    extension CGVector: Then {}
#endif
