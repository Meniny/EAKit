//
//  Simulator.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public struct Simulator {
    
    public static var isRunning: Bool = {
        #if (arch(i386) || arch(x86_64)) && !os(OSX) && !os(Linux)
            return true
        #else
            return false
        #endif
    }()
}

#if os(iOS)
import UIKit

public extension UIDevice {
    public static var isSimulator: Bool {
        return Simulator.isRunning
    }
    
    public var isSimulator: Bool {
        return Simulator.isRunning
    }
}

#endif
