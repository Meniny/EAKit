//
//  Font.swift
//  EAKit
//
//  Created by Meniny on 2018-05-18.
//

import Foundation

#if os(macOS)
import Cocoa
/// aka `NSFont`
public typealias Font = NSFont
#else
import UIKit
/// aka `UIFont`
public typealias Font = UIFont
#endif
