//
//  UIApplication.swift
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
//  Created by Elias Abel on 2018/1/11.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import Foundation
    import UIKit

    public extension UIApplication {
        public static var rootViewController: UIViewController? {
            return UIApplication.shared.keyWindow?.rootViewController
        }
    }
    
    public extension UIApplication {
        /// EAKit: Run a block in background after app resigns activity
        public func backgroundTask(_ closure: @escaping () -> Void, expirationHandler: (() -> Void)? = nil) {
            DispatchQueue.main.async {
                let taskID: UIBackgroundTaskIdentifier
                if let expirationHandler = expirationHandler {
                    taskID = self.beginBackgroundTask(expirationHandler: expirationHandler)
                } else {
                    taskID = self.beginBackgroundTask(expirationHandler: { })
                }
                closure()
                self.endBackgroundTask(taskID)
            }
        }
        
        /// EAKit: Get the top most view controller from the base view controller; default param is UIWindow's rootViewController
        public class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
            if let nav = base as? UINavigationController {
                return self.topViewController(base: nav.visibleViewController)
            }
            if let tab = base as? UITabBarController {
                if let selected = tab.selectedViewController {
                    return self.topViewController(base: selected)
                }
            }
            if let presented = base?.presentedViewController {
                return self.topViewController(base: presented)
            }
            return base
        }
    }
    
#endif
