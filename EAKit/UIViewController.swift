//
//  UIViewController.swift
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
//  Created by Elias Abel on 2018/1/5.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension UIViewController {
        public var extendedLayout: Bool {
            set {
                extendedLayoutIncludesOpaqueBars = !newValue
                edgesForExtendedLayout = newValue ? .all : []
            }
            get {
                return edgesForExtendedLayout != []
            }
        }
    }

    public extension UIViewController {
        
        public class func instance(storyboard sbname: String, bundle: Bundle? = nil, identifier: String?) -> Self {
            return helper_instance(storyboard: sbname, bundle: bundle, identifier: identifier)
        }
        
        public class func sb(_ sbname: String, bundle: Bundle? = nil, id: String?) -> Self {
            return helper_instance(storyboard: sbname, bundle: bundle, identifier: id)
        }
        
        private class func helper_instance<T>(storyboard sbname: String, bundle: Bundle?, identifier: String?) -> T {
            let storyboard = UIStoryboard.init(name: sbname, bundle: bundle)
            guard let id = identifier else {
                return storyboard.instantiateInitialViewController() as! T
            }
            return storyboard.instantiateViewController(withIdentifier: id) as! T
        }
    }
#endif
