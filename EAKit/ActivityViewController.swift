//
//  ActivityViewController.swift
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
//  Created by Elias Abel on 2018/1/9.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

#if os(iOS)
import Foundation
import UIKit

public extension UIViewController {
    
    public func share(items: [Any],
                      barButtonItem: UIBarButtonItem?,
                      completion: UIActivityViewControllerCompletionWithItemsHandler? = nil) {
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.barButtonItem = barButtonItem
        activityController.completionWithItemsHandler = completion
        self.present(activityController, animated: true, completion: nil)
    }
    
    public func share(items: [Any],
                      sourceView: UIView?,
                      sourceRect: CGRect?,
                      completion: UIActivityViewControllerCompletionWithItemsHandler? = nil) {
        let activityController = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sourceView
        if let rect = sourceRect {
            activityController.popoverPresentationController?.sourceRect = rect
        }
        activityController.completionWithItemsHandler = completion
        self.present(activityController, animated: true, completion: nil)
    }
}

public extension UIActivityViewController {
    
    public static func share(items: [Any],
                             from controller: UIViewController,
                             barButtonItem: UIBarButtonItem?,
                             completion: UIActivityViewControllerCompletionWithItemsHandler? = nil) {
        controller.share(items: items, barButtonItem: barButtonItem, completion: completion)
    }
    
    public static func share(items: [Any],
                             from controller: UIViewController,
                             sourceView: UIView?,
                             sourceRect: CGRect?,
                             completion: UIActivityViewControllerCompletionWithItemsHandler? = nil) {
        controller.share(items: items, sourceView: sourceView, sourceRect: sourceRect, completion: completion)
    }
}
#endif
