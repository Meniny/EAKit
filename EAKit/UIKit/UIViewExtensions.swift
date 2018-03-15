//
//  UIViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/5/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
    import UIKit

    // MARK: - enums

    /// EAKit: Shake directions of a view.
    ///
    /// - horizontal: Shake left and right.
    /// - vertical: Shake up and down.
    public enum ShakeDirection {
        case horizontal
        case vertical
    }

    /// EAKit: Angle units.
    ///
    /// - degrees: degrees.
    /// - radians: radians.
    public enum AngleUnit {
        case degrees
        case radians
    }

    /// EAKit: Shake animations types.
    ///
    /// - linear: linear animation.
    /// - easeIn: easeIn animation
    /// - easeOut: easeOut animation.
    /// - easeInOut: easeInOut animation.
    public enum ShakeAnimationType {
        case linear
        case easeIn
        case easeOut
        case easeInOut
    }

    // MARK: - Properties
    public extension UIView {
        
        public convenience init(frame: CGRect = .zero, color: UIColor?) {
            self.init(frame: frame)
            self.backgroundColor = color
        }
        
        /// EAKit: Border color of view; also inspectable from Storyboard.
        @IBInspectable public var borderColor: UIColor? {
            get {
                guard let color = layer.borderColor else { return nil }
                return UIColor(cgColor: color)
            }
            set {
                guard let color = newValue else {
                    layer.borderColor = nil
                    return
                }
                // Fix React-Native conflict issue
                guard String(describing: type(of: color)) != "__NSCFType" else { return }
                layer.borderColor = color.cgColor
            }
        }
        
        /// EAKit: Border width of view; also inspectable from Storyboard.
        @IBInspectable public var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
        
        /// EAKit: Corner radius of view; also inspectable from Storyboard.
        @IBInspectable public var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.masksToBounds = true
                layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
            }
        }
        
        /// EAKit: First responder.
        public var firstResponder: UIView? {
            guard !isFirstResponder else { return self }
            for subView in subviews where subView.isFirstResponder {
                return subView
            }
            return nil
        }
        
        // EAKit: Height of view.
        public var height: CGFloat {
            get {
                return frame.size.height
            }
            set {
                frame.size.height = newValue
            }
        }
        
        /// EAKit: Check if view is in RTL format.
        public var isRightToLeft: Bool {
            if #available(iOS 10.0, *, tvOS 10.0, *) {
                return effectiveUserInterfaceLayoutDirection == .rightToLeft
            } else {
                return false
            }
        }
        
        /// EAKit: Take screenshot of view (if applicable).
        public var screenshot: UIImage? {
            UIGraphicsBeginImageContextWithOptions(layer.frame.size, false, 0)
            defer {
                UIGraphicsEndImageContext()
            }
            guard let context = UIGraphicsGetCurrentContext() else { return nil }
            layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }
        
        /// EAKit: Shadow color of view; also inspectable from Storyboard.
        @IBInspectable public var shadowColor: UIColor? {
            get {
                guard let color = layer.shadowColor else { return nil }
                return UIColor(cgColor: color)
            }
            set {
                layer.shadowColor = newValue?.cgColor
            }
        }
        
        /// EAKit: Shadow offset of view; also inspectable from Storyboard.
        @IBInspectable public var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.shadowOffset = newValue
            }
        }
        
        /// EAKit: Shadow opacity of view; also inspectable from Storyboard.
        @IBInspectable public var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
        
        /// EAKit: Shadow radius of view; also inspectable from Storyboard.
        @IBInspectable public var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowRadius = newValue
            }
        }
        
        /// EAKit: Size of view.
        public var size: CGSize {
            get {
                return frame.size
            }
            set {
                width = newValue.width
                height = newValue.height
            }
        }
        
        /// EAKit: Get view's parent view controller
        public var parentViewController: UIViewController? {
            weak var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder!.next
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
            }
            return nil
        }
        
        /// EAKit: Width of view.
        public var width: CGFloat {
            get {
                return frame.size.width
            }
            set {
                frame.size.width = newValue
            }
        }
        
        /// EAKit: x origin of view.
        public var x: CGFloat {
            get {
                return frame.origin.x
            }
            set {
                frame.origin.x = newValue
            }
        }
        
        /// EAKit: y origin of view.
        public var y: CGFloat {
            get {
                return frame.origin.y
            }
            set {
                frame.origin.y = newValue
            }
        }
        
    }

    // MARK: - Methods
    public extension UIView {
        
        /// EAKit: Set some or all corners radiuses of view.
        ///
        /// - Parameters:
        ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
        ///   - radius: radius for selected corners.
        public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
            let maskPath = UIBezierPath(roundedRect: bounds,
                                        byRoundingCorners: corners,
                                        cornerRadii: CGSize(width: radius, height: radius))
            let shape = CAShapeLayer()
            shape.path = maskPath.cgPath
            layer.mask = shape
        }
        
        /// EAKit: Add shadow to view.
        ///
        /// - Parameters:
        ///   - color: shadow color (default is Charcoal: #424141).
        ///   - radius: shadow radius (default is 3).
        ///   - offset: shadow offset (default is .zero).
        ///   - opacity: shadow opacity (default is 0.5).
        public func addShadow(ofColor color: UIColor = UIColor(red: 0.26, green: 0.25, blue: 0.25, alpha: 1.00), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
            layer.shadowColor = color.cgColor
            layer.shadowOffset = offset
            layer.shadowRadius = radius
            layer.shadowOpacity = opacity
            layer.masksToBounds = true
        }
        
        /// EAKit: Add array of subviews to view.
        ///
        /// - Parameter subviews: array of subviews to add to self.
        public func addSubviews(_ svs: [UIView]) {
            svs.forEach({self.addSubview($0)})
        }
        
        /// EAKit: Add array of subviews to view.
        ///
        /// - Parameter subviews: list of subviews to add to self.
        public func addSubviews(_ svs: UIView...) {
            self.addSubviews(svs)
        }
        
        /// EAKit: Fade in view.
        ///
        /// - Parameters:
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - completion: optional completion handler to run with animation finishes (default is nil)
        public func fadeIn(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
            if isHidden {
                isHidden = false
            }
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1
            }, completion: completion)
        }
        
        /// EAKit: Fade out view.
        ///
        /// - Parameters:
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - completion: optional completion handler to run with animation finishes (default is nil)
        public func fadeOut(duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
            if isHidden {
                isHidden = false
            }
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0
            }, completion: completion)
        }
        
        /// EAKit: Load view from nib.
        ///
        /// - Parameters:
        ///   - name: nib name.
        ///   - bundle: bundle of nib (default is nil).
        /// - Returns: optional UIView (if applicable).
        public class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
            return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
        }
        
        /// EAKit: Remove all subviews in view.
        public func removeSubviews() {
            subviews.forEach({$0.removeFromSuperview()})
        }
        
        /// EAKit: Remove all gesture recognizers from view.
        public func removeGestureRecognizers() {
            gestureRecognizers?.forEach(removeGestureRecognizer)
        }
        
        /// EAKit: Rotate view by angle on relative axis.
        ///
        /// - Parameters:
        ///   - angle: angle to rotate view by.
        ///   - type: type of the rotation angle.
        ///   - animated: set true to animate rotation (default is true).
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - completion: optional completion handler to run with animation finishes (default is nil).
        public func rotate(byAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
            let angleWithType = (type == .degrees) ? CGFloat.pi * angle / 180.0 : angle
            let aDuration = animated ? duration : 0
            UIView.animate(withDuration: aDuration, delay: 0, options: .curveLinear, animations: { () -> Void in
                self.transform = self.transform.rotated(by: angleWithType)
            }, completion: completion)
        }
        
        /// EAKit: Rotate view to angle on fixed axis.
        ///
        /// - Parameters:
        ///   - angle: angle to rotate view to.
        ///   - type: type of the rotation angle.
        ///   - animated: set true to animate rotation (default is false).
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - completion: optional completion handler to run with animation finishes (default is nil).
        public func rotate(toAngle angle: CGFloat, ofType type: AngleUnit, animated: Bool = false, duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
            let angleWithType = (type == .degrees) ? CGFloat.pi * angle / 180.0 : angle
            let aDuration = animated ? duration : 0
            UIView.animate(withDuration: aDuration, animations: {
                self.transform = self.transform.concatenating(CGAffineTransform(rotationAngle: angleWithType))
            }, completion: completion)
        }
        
        /// EAKit: Scale view by offset.
        ///
        /// - Parameters:
        ///   - offset: scale offset
        ///   - animated: set true to animate scaling (default is false).
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - completion: optional completion handler to run with animation finishes (default is nil).
        public func scale(by offset: CGPoint, animated: Bool = false, duration: TimeInterval = 1, completion: ((Bool) -> Void)? = nil) {
            if animated {
                UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: { () -> Void in
                    self.transform = self.transform.scaledBy(x: offset.x, y: offset.y)
                }, completion: completion)
            } else {
                transform = transform.scaledBy(x: offset.x, y: offset.y)
                completion?(true)
            }
        }
        
        /// EAKit: Shake view.
        ///
        /// - Parameters:
        ///   - direction: shake direction (horizontal or vertical), (default is .horizontal)
        ///   - duration: animation duration in seconds (default is 1 second).
        ///   - animationType: shake animation type (default is .easeOut).
        ///   - completion: optional completion handler to run with animation finishes (default is nil).
        public func shake(direction: ShakeDirection = .horizontal, duration: TimeInterval = 1, animationType: ShakeAnimationType = .easeOut, completion:(() -> Void)? = nil) {
            
            CATransaction.begin()
            let animation: CAKeyframeAnimation
            switch direction {
            case .horizontal:
                animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            case .vertical:
                animation = CAKeyframeAnimation(keyPath: "transform.translation.y")
            }
            switch animationType {
            case .linear:
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            case .easeIn:
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
            case .easeOut:
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            case .easeInOut:
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            }
            CATransaction.setCompletionBlock(completion)
            animation.duration = duration
            animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
            layer.add(animation, forKey: "shake")
            CATransaction.commit()
        }
        
        /// EAKit: Add Visual Format constraints.
        ///
        /// - Parameters:
        ///   - withFormat: visual Format language
        ///   - views: array of views which will be accessed starting with index 0 (example: [v0], [v1], [v2]..)
        @available(iOS 9, *) public func addConstraints(withFormat: String, views: UIView...) {
            // https://videos.letsbuildthatapp.com/
            var viewsDictionary: [String: UIView] = [:]
            for (index, view) in views.enumerated() {
                let key = "v\(index)"
                view.translatesAutoresizingMaskIntoConstraints = false
                viewsDictionary[key] = view
            }
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: withFormat, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        }
        
        /// EAKit: Anchor all sides of the view into it's superview.
        @available(iOS 9, *) public func fillToSuperview() {
            // https://videos.letsbuildthatapp.com/
            translatesAutoresizingMaskIntoConstraints = false
            if let superview = superview {
                leftAnchor.constraint(equalTo: superview.leftAnchor).isActive = true
                rightAnchor.constraint(equalTo: superview.rightAnchor).isActive = true
                topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
                bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
            }
        }
        
        /// EAKit: Add anchors from any side of the current view into the specified anchors and returns the newly added constraints.
        ///
        /// - Parameters:
        ///   - top: current view's top anchor will be anchored into the specified anchor
        ///   - left: current view's left anchor will be anchored into the specified anchor
        ///   - bottom: current view's bottom anchor will be anchored into the specified anchor
        ///   - right: current view's right anchor will be anchored into the specified anchor
        ///   - topConstant: current view's top anchor margin
        ///   - leftConstant: current view's left anchor margin
        ///   - bottomConstant: current view's bottom anchor margin
        ///   - rightConstant: current view's right anchor margin
        ///   - widthConstant: current view's width
        ///   - heightConstant: current view's height
        /// - Returns: array of newly added constraints (if applicable).
        @available(iOS 9, *) @discardableResult public func anchor(
            top: NSLayoutYAxisAnchor? = nil,
            left: NSLayoutXAxisAnchor? = nil,
            bottom: NSLayoutYAxisAnchor? = nil,
            right: NSLayoutXAxisAnchor? = nil,
            topConstant: CGFloat = 0,
            leftConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            rightConstant: CGFloat = 0,
            widthConstant: CGFloat = 0,
            heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
            // https://videos.letsbuildthatapp.com/
            translatesAutoresizingMaskIntoConstraints = false
            
            var anchors = [NSLayoutConstraint]()
            
            if let top = top {
                anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
            }
            
            if let left = left {
                anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
            }
            
            if let bottom = bottom {
                anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
            }
            
            if let right = right {
                anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
            }
            
            if widthConstant > 0 {
                anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
            }
            
            if heightConstant > 0 {
                anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
            }
            
            anchors.forEach({$0.isActive = true})
            
            return anchors
        }
        
        /// EAKit: Anchor center X into current view's superview with a constant margin value.
        ///
        /// - Parameter constant: constant of the anchor constraint (default is 0).
        @available(iOS 9, *) public func anchorCenterXToSuperview(constant: CGFloat = 0) {
            // https://videos.letsbuildthatapp.com/
            translatesAutoresizingMaskIntoConstraints = false
            if let anchor = superview?.centerXAnchor {
                centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
        
        /// EAKit: Anchor center Y into current view's superview with a constant margin value.
        ///
        /// - Parameter withConstant: constant of the anchor constraint (default is 0).
        @available(iOS 9, *) public func anchorCenterYToSuperview(constant: CGFloat = 0) {
            // https://videos.letsbuildthatapp.com/
            translatesAutoresizingMaskIntoConstraints = false
            if let anchor = superview?.centerYAnchor {
                centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            }
        }
        
        /// EAKit: Anchor center X and Y into current view's superview
        @available(iOS 9, *) public func anchorCenterSuperview() {
            // https://videos.letsbuildthatapp.com/
            anchorCenterXToSuperview()
            anchorCenterYToSuperview()
        }
        
    }
    
    // MARK: Transform Extensions
    extension UIView {
        /// EZSwiftExtensions
        public func setRotationX(_ x: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DRotate(transform, x.degreesToRadians, 1.0, 0.0, 0.0)
            self.layer.transform = transform
        }
        
        /// EZSwiftExtensions
        public func setRotationY(_ y: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DRotate(transform, y.degreesToRadians, 0.0, 1.0, 0.0)
            self.layer.transform = transform
        }
        
        /// EZSwiftExtensions
        public func setRotationZ(_ z: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DRotate(transform, z.degreesToRadians, 0.0, 0.0, 1.0)
            self.layer.transform = transform
        }
        
        /// EZSwiftExtensions
        public func setRotation(x: CGFloat, y: CGFloat, z: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DRotate(transform, x.degreesToRadians, 1.0, 0.0, 0.0)
            transform = CATransform3DRotate(transform, y.degreesToRadians, 0.0, 1.0, 0.0)
            transform = CATransform3DRotate(transform, z.degreesToRadians, 0.0, 0.0, 1.0)
            self.layer.transform = transform
        }
        
        /// EZSwiftExtensions
        public func setScale(x: CGFloat, y: CGFloat) {
            var transform = CATransform3DIdentity
            transform.m34 = 1.0 / -1000.0
            transform = CATransform3DScale(transform, x, y, 1)
            self.layer.transform = transform
        }
    }
    
    private let UIViewAnimationDuration: TimeInterval = 1
    private let UIViewAnimationSpringDamping: CGFloat = 0.5
    private let UIViewAnimationSpringVelocity: CGFloat = 0.5
    
    //TODO: add this to readme
    // MARK: Animation Extensions
    extension UIView {
        /// EAKit
        public func spring(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
            spring(duration: UIViewAnimationDuration, animations: animations, completion: completion)
        }
        
        /// EAKit
        public func spring(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
            UIView.animate(
                withDuration: UIViewAnimationDuration,
                delay: 0,
                usingSpringWithDamping: UIViewAnimationSpringDamping,
                initialSpringVelocity: UIViewAnimationSpringVelocity,
                options: UIViewAnimationOptions.allowAnimatedContent,
                animations: animations,
                completion: completion
            )
        }
        
        /// EAKit
        public func animate(duration: TimeInterval, animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
            UIView.animate(withDuration: duration, animations: animations, completion: completion)
        }
        
        /// EAKit
        public func animate(animations: @escaping (() -> Void), completion: ((Bool) -> Void)? = nil) {
            animate(duration: UIViewAnimationDuration, animations: animations, completion: completion)
        }
        
        /// EAKit
        public func pop() {
            setScale(x: 1.1, y: 1.1)
            spring(duration: 0.2, animations: { [unowned self] () -> Void in
                self.setScale(x: 1, y: 1)
            })
        }
        
        /// EAKit
        public func popBig() {
            setScale(x: 1.25, y: 1.25)
            spring(duration: 0.2, animations: { [unowned self] () -> Void in
                self.setScale(x: 1, y: 1)
            })
        }
        
        //EAKit: Reverse pop, good for button animations
        public func reversePop() {
            setScale(x: 0.9, y: 0.9)
            UIView.animate(withDuration: 0.05, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: { [weak self] in
                self?.setScale(x: 1, y: 1)
            })
        }
    }
    
    // MARK: Gesture Extensions
    extension UIView {
        /// http://stackoverflow.com/questions/4660371/how-to-add-a-touch-event-to-a-uiview/32182866#32182866
        /// EAKit
        public func addTapGesture(taps: Int = 1, target: AnyObject, action: Selector) {
            let tap = UITapGestureRecognizer(target: target, action: action)
            tap.numberOfTapsRequired = taps
            self.addGestureRecognizer(tap)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit - Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
        public func addTapGesture(taps: Int = 1, touches: Int = 1, action: ((UITapGestureRecognizer) -> Void)?) {
            let tap = UIClosureTap.init(taps: taps, touches: 1, action: action)
            self.addGestureRecognizer(tap)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit
        public func addSwipeGesture(direction: UISwipeGestureRecognizerDirection, numberOfTouches: Int = 1, target: AnyObject, action: Selector) {
            let swipe = UISwipeGestureRecognizer(target: target, action: action)
            swipe.direction = direction
            
            #if os(iOS)
                swipe.numberOfTouchesRequired = numberOfTouches
            #endif
            
            self.addGestureRecognizer(swipe)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit - Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
        public func addSwipeGesture(to direction: UISwipeGestureRecognizerDirection, touches: Int = 1, action: ((UISwipeGestureRecognizer) -> Void)?) {
            let swipe = UIClosureSwipe.init(to: direction, touches: touches, action: action)
            self.addGestureRecognizer(swipe)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit
        public func addPanGesture(target: AnyObject, action: Selector) {
            let pan = UIPanGestureRecognizer(target: target, action: action)
            self.addGestureRecognizer(pan)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit - Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
        public func addPanGesture(action: ((UIPanGestureRecognizer) -> Void)?) {
            let pan = UIClosurePan.init(action: action)
            self.addGestureRecognizer(pan)
            self.isUserInteractionEnabled = true
        }
        
        #if os(iOS)
        
        /// EAKit
        public func addPinchGesture(target: AnyObject, action: Selector) {
            let pinch = UIPinchGestureRecognizer(target: target, action: action)
            self.addGestureRecognizer(pinch)
            self.isUserInteractionEnabled = true
        }
        
        #endif
        
        #if os(iOS)
        
        /// EAKit - Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
        public func addPinchGesture(action: ((UIPinchGestureRecognizer) -> Void)?) {
            let pinch = UIClosurePinch.init(action: action)
            self.addGestureRecognizer(pinch)
            self.isUserInteractionEnabled = true
        }
        
        #endif
        
        /// EAKit
        public func addLongPressGesture(target: AnyObject, action: Selector) {
            let longPress = UILongPressGestureRecognizer(target: target, action: action)
            self.addGestureRecognizer(longPress)
            self.isUserInteractionEnabled = true
        }
        
        /// EAKit - Make sure you use  "[weak self] (gesture) in" if you are using the keyword self inside the closure or there might be a memory leak
        public func addLongPressGesture(action: ((UILongPressGestureRecognizer) -> Void)?) {
            let longPress = UIClosureLongPress.init(action: action)
            self.addGestureRecognizer(longPress)
            self.isUserInteractionEnabled = true
        }
    }
    
    extension UIView {
        ///EAKit: Loops until it finds the top root view. //TODO: Add to readme
        func rootView() -> UIView {
            guard let parentView = superview else {
                return self
            }
            return parentView.rootView()
        }
    }
    
    // MARK: Fade Extensions
    
    public let UIViewDefaultFadingDuration: TimeInterval = 0.4
    
    extension UIView {
        ///EAKit: Fade in with duration, delay and completion block.
        public func fadeIn(_ duration: TimeInterval? = UIViewDefaultFadingDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
            fadeTo(1.0, duration: duration, delay: delay, completion: completion)
        }
        
        /// EAKit
        public func fadeOut(_ duration: TimeInterval? = UIViewDefaultFadingDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
            fadeTo(0.0, duration: duration, delay: delay, completion: completion)
        }
        
        /// Fade to specific value     with duration, delay and completion block.
        public func fadeTo(_ value: CGFloat, duration: TimeInterval? = UIViewDefaultFadingDuration, delay: TimeInterval? = 0.0, completion: ((Bool) -> Void)? = nil) {
            UIView.animate(withDuration: duration ?? UIViewDefaultFadingDuration, delay: delay ?? UIViewDefaultFadingDuration, options: .curveEaseInOut, animations: {
                self.alpha = value
            }, completion: completion)
        }
    }
#endif
