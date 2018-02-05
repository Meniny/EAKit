//
//  UIImageView.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 2018/1/16.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import Foundation
#if os(iOS)
    import UIKit
#elseif os(watchOS)
    import WatchKit
#elseif os(OSX)
    import Cocoa
#endif
/// The types of icon
///
/// - image: `UIImage`/`NSImage` object
/// - named: Image name in `.xcassets`
/// - path: Image path in main bundle
/// - remote: Remote image URL
/// - `nil`: Just nil
public enum EAImage: Equatable {
    #if os(OSX)
    case object(NSImage?)
    #else
    case object(UIImage?)
    #endif
    case named(String)
    case path(URL?)
    case remote(URL?)
    case `nil`
    
    public static func == (lhs: EAImage, rhs: EAImage) -> Bool {
        switch (lhs, rhs) {
        case let (.object(a), .object(b)): return a == b
        case let (.named(a), .named(b)): return a == b
        case let (.path(a), .path(b)): return a == b
        case let (.remote(a), .remote(b)): return a == b
        case (.nil, .nil): return true
        default: return false
        }
    }
}

public extension EAImage {
    #if os(iOS)
        /// Cannot return the remote image limitedly
        public var image: UIImage? {
            switch self {
            case .object(let img):
                return img
            case .named(let name):
                return UIImage.init(named: name)
            case .path(let path):
                guard let path = path else {
                    return nil
                }
                return UIImage.init(contentsOfFile: path.path)
            default:
                return nil
            }
        }
    #elseif os(OSX)
        /// Cannot return the remote image limitedly
        public var image: NSImage? {
            switch self {
            case .object(let img):
                return img
            case .named(let name):
                return NSImage.init(named: NSImage.Name(rawValue: name))
            case .path(let path):
                guard let path = path else {
                    return nil
                }
                return NSImage.init(contentsOfFile: path.path)
            default:
                return nil
            }
        }
    #endif
}

public typealias Image = EAImage

