//
//  Stringify.swift
//  EAKit-iOS
//
//  Created by Meniny on 2018-02-05.
//

import Foundation

public func stringify(_ cls: AnyClass) -> String {
    return "\(type(of: cls))".components(separatedBy: ".").first ?? ""
}
