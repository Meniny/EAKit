//
//  TopestViewController.swift
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
//  Created by Elias Abel on 2018/1/23.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension UIApplication {
        public var topestViewController: UIViewController? {
            return self.keyWindow?.topestViewController
        }
    }

    public extension UIWindow {
        public var topestViewController: UIViewController? {
            let root = self.rootViewController
            if let navi = root as? UINavigationController {
                return navi.topestViewController
            }
            if let tab = root as? UITabBarController {
                return tab.topestViewController
            }
            return root?.findTopestViewController()
        }
    }

    public extension UINavigationController {
        public var topestViewController: UIViewController? {
            let top = self.topViewController
            if let presented = top?.presentedViewController {
                if let topPresented = presented as? UINavigationController {
                    return topPresented.topestViewController
                }
                return presented
            }
            return top
        }
    }

    public extension UITabBarController {
        public var topestViewController: UIViewController? {
            let selected = self.selectedViewController
            if let navi = selected as? UINavigationController {
                return navi.topestViewController
            }
            return selected
        }
    }

    public extension UIViewController {
        public func findTopestViewController() -> UIViewController? {
            if let presented = self.presentedViewController {
                if let topPresented = presented as? UINavigationController {
                    return topPresented.topestViewController
                }
                return presented
            }
            return self
        }
    }
#endif
