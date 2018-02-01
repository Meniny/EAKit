//
//  Int.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public extension Int {
    /// generate a random number
    public static func random(_ around: Int = Int.max) -> Int {
        return Int(arc4random()) % around
    }
    
    public var stringify: String {
        return "\(self)"
    }
}
