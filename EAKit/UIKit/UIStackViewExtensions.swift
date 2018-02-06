//
//  UIStackView.swift
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
    
    @available(iOS 9.0, *)
    extension UIStackView {
        
        /// EAKit: Convenience initializer in order to directly pass the distribution, alignment, axis and spacing of the stack view.
        ///
        /// - Parameters:
        ///   - distribution: the distribution of the stack view
        ///   - alignment: the alignment of the stack view
        ///   - axis: the axis (e.g. horizontal or vertical)
        ///   - spacing: spacing between subviews, default is 0
        public convenience init(distribution: UIStackViewDistribution,
                                alignment: UIStackViewAlignment,
                                axis: UILayoutConstraintAxis,
                                spacing: CGFloat = 0) {
            self.init()
            self.distribution = distribution
            self.alignment = alignment
            self.axis = axis
            self.spacing = spacing
        }
        
        /// EAKit: Add multiple subviews at once. They will be added in order (top to bottom for a vertical stack view and left to right for a vertical stack view)
        ///
        /// - Parameter views: array of views to add
        public func addArrangedSubviews(_ views: UIView...) {
            for view in views {
                self.addArrangedSubview(view)
            }
        }
        
    }
    
#endif
