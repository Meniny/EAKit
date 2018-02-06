//
//  UIButtonExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/22/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
import UIKit
    
    public extension UIButton {
        fileprivate func actionHandlerClosure(_ closure: (() -> Void)? = nil) {
            struct BT {
                static var closure :(() -> Void)?
            }
            if closure != nil {
                BT.closure = closure
            } else {
                BT.closure?()
            }
        }
        
        @objc
        fileprivate func triggerActionHandleBlock() {
            self.actionHandlerClosure()
        }
        
        public func addClosure(for controlEvents: UIControlEvents, action closure: @escaping () -> Void) {
            self.actionHandlerClosure(closure)
            self.addTarget(self, action: #selector(triggerActionHandleBlock), for: controlEvents)
        }
    }

    // MARK: - Properties
    public extension UIButton {
        
        /// EAKit: Image of disabled state for button; also inspectable from Storyboard.
        @IBInspectable public var imageForDisabled: UIImage? {
            get {
                return image(for: .disabled)
            }
            set {
                setImage(newValue, for: .disabled)
            }
        }
        
        /// EAKit: Image of highlighted state for button; also inspectable from Storyboard.
        @IBInspectable public var imageForHighlighted: UIImage? {
            get {
                return image(for: .highlighted)
            }
            set {
                setImage(newValue, for: .highlighted)
            }
        }
        
        /// EAKit: Image of normal state for button; also inspectable from Storyboard.
        @IBInspectable public var imageForNormal: UIImage? {
            get {
                return image(for: .normal)
            }
            set {
                setImage(newValue, for: .normal)
            }
        }
        
        /// EAKit: Image of selected state for button; also inspectable from Storyboard.
        @IBInspectable public var imageForSelected: UIImage? {
            get {
                return image(for: .selected)
            }
            set {
                setImage(newValue, for: .selected)
            }
        }
        
        /// EAKit: Title color of disabled state for button; also inspectable from Storyboard.
        @IBInspectable public var titleColorForDisabled: UIColor? {
            get {
                return titleColor(for: .disabled)
            }
            set {
                setTitleColor(newValue, for: .disabled)
            }
        }
        
        /// EAKit: Title color of highlighted state for button; also inspectable from Storyboard.
        @IBInspectable public var titleColorForHighlighted: UIColor? {
            get {
                return titleColor(for: .highlighted)
            }
            set {
                setTitleColor(newValue, for: .highlighted)
            }
        }
        
        /// EAKit: Title color of normal state for button; also inspectable from Storyboard.
        @IBInspectable public var titleColorForNormal: UIColor? {
            get {
                return titleColor(for: .normal)
            }
            set {
                setTitleColor(newValue, for: .normal)
            }
        }
        
        /// EAKit: Title color of selected state for button; also inspectable from Storyboard.
        @IBInspectable public var titleColorForSelected: UIColor? {
            get {
                return titleColor(for: .selected)
            }
            set {
                setTitleColor(newValue, for: .selected)
            }
        }
        
        /// EAKit: Title of disabled state for button; also inspectable from Storyboard.
        @IBInspectable public var titleForDisabled: String? {
            get {
                return title(for: .disabled)
            }
            set {
                setTitle(newValue, for: .disabled)
            }
        }
        
        /// EAKit: Title of highlighted state for button; also inspectable from Storyboard.
        @IBInspectable public var titleForHighlighted: String? {
            get {
                return title(for: .highlighted)
            }
            set {
                setTitle(newValue, for: .highlighted)
            }
        }
        
        /// EAKit: Title of normal state for button; also inspectable from Storyboard.
        @IBInspectable public var titleForNormal: String? {
            get {
                return title(for: .normal)
            }
            set {
                setTitle(newValue, for: .normal)
            }
        }
        
        /// EAKit: Title of selected state for button; also inspectable from Storyboard.
        @IBInspectable public var titleForSelected: String? {
            get {
                return title(for: .selected)
            }
            set {
                setTitle(newValue, for: .selected)
            }
        }
        
    }

    // MARK: - Methods
    public extension UIButton {
        
        private var states: [UIControlState] {
            return [.normal, .selected, .highlighted, .disabled]
        }
        
        /// EAKit: Set image for all states.
        ///
        /// - Parameter image: UIImage.
        public func setImageForAllStates(_ image: UIImage) {
            states.forEach { self.setImage(image, for: $0) }
        }
        
        /// EAKit: Set title color for all states.
        ///
        /// - Parameter color: UIColor.
        public func setTitleColorForAllStates(_ color: UIColor) {
            states.forEach { self.setTitleColor(color, for: $0) }
        }
        
        /// EAKit: Set title for all states.
        ///
        /// - Parameter title: title string.
        public func setTitleForAllStates(_ title: String) {
            states.forEach { self.setTitle(title, for: $0) }
        }
        
        /// EAKit: Convenience constructor for UIButton.
        public convenience init(target: AnyObject, action: Selector) {
            self.init(frame: CGRect.zero)
            self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        }
        
        /// EAKit: Set a background color for the button.
        public func setBackgroundColor(_ color: UIColor, forState: UIControlState) {
            UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
            UIGraphicsGetCurrentContext()?.setFillColor(color.cgColor)
            UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
        
    }
#endif
