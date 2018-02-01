//
//  DebugPrinter.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

import Foundation

public func dumper(_ item: Any?) -> String {
    var output = ""
    guard let i = item else {
        dump(item, to: &output)
        return output
    }
    dump(i, to: &output)
    return output
}

