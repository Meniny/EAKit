//
//  UIGestureRecognizer.swift
//  EAKit-iOS
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
//  Created by Elias Abel on 2018/2/6.
//  
//

#if os(iOS) || os(tvOS)
    
    import UIKit
    
    /// Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
    open class UIClosureTap: UITapGestureRecognizer {
        private var tapAction: ((UITapGestureRecognizer) -> Void)?
        
        public override init(target: Any?, action: Selector?) {
            super.init(target: target, action: action)
        }
        
        public convenience init(taps: Int = 1, touches: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
            self.init()
            self.numberOfTapsRequired = taps
            
            #if os(iOS)
                self.numberOfTouchesRequired = touches
            #endif
            
            self.tapAction = action
            self.addTarget(self, action: #selector(UIClosureTap.didTap(_:)))
        }
        
        @objc
        open func didTap(_ tap: UITapGestureRecognizer) {
            self.tapAction?(tap)
        }
    }
    
    /// Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
    open class UIClosureLongPress: UILongPressGestureRecognizer {
        private var longPressAction: ((UILongPressGestureRecognizer) -> Void)?
        
        public override init(target: Any?, action: Selector?) {
            super.init(target: target, action: action)
        }
        
        public convenience init(action: ((UILongPressGestureRecognizer) -> Void)?) {
            self.init()
            self.longPressAction = action
            self.addTarget(self, action: #selector(UIClosureLongPress.didLongPressed(_:)))
        }
        
        @objc
        open func didLongPressed(_ longPress: UILongPressGestureRecognizer) {
            if longPress.state == UIGestureRecognizerState.began {
                self.longPressAction?(longPress)
            }
        }
    }
    
    /// Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
    open class UIClosurePan: UIPanGestureRecognizer {
        private var panAction: ((UIPanGestureRecognizer) -> Void)?
        
        public override init(target: Any?, action: Selector?) {
            super.init(target: target, action: action)
        }
        
        public convenience init(action: ((UIPanGestureRecognizer) -> Void)?) {
            self.init()
            self.panAction = action
            self.addTarget(self, action: #selector(UIClosurePan.didPan(_:)))
        }
        
        @objc
        open func didPan(_ pan: UIPanGestureRecognizer) {
            self.panAction?(pan)
        }
    }
    
    ///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
    open class UIClosurePinch: UIPinchGestureRecognizer {
        private var pinchAction: ((UIPinchGestureRecognizer) -> Void)?
        
        public override init(target: Any?, action: Selector?) {
            super.init(target: target, action: action)
        }
        
        public convenience init(action: ((UIPinchGestureRecognizer) -> Void)?) {
            self.init()
            self.pinchAction = action
            self.addTarget(self, action: #selector(UIClosurePinch.didPinch(_:)))
        }
        
        @objc
        open func didPinch(_ pinch: UIPinchGestureRecognizer) {
            self.pinchAction?(pinch)
        }
    }
    
    ///Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
    open class UIClosureSwipe: UISwipeGestureRecognizer {
        private var swipeAction: ((UISwipeGestureRecognizer) -> Void)?
        
        public override init(target: Any?, action: Selector?) {
            super.init(target: target, action: action)
        }
        
        public convenience init(to direction: UISwipeGestureRecognizerDirection, touches: Int = 1, action: ((UISwipeGestureRecognizer) -> Void)?) {
            self.init()
            self.direction = direction
            #if os(iOS)
                self.numberOfTouchesRequired = touches
            #endif
            
            self.swipeAction = action
            self.addTarget(self, action: #selector(UIClosureSwipe.didSwipe(_:)))
        }
        
        @objc
        open func didSwipe(_ swipe: UISwipeGestureRecognizer) {
            self.swipeAction?(swipe)
        }
    }
    
#endif
