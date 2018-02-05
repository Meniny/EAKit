//
//  NSViewExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 3/3/17.
//  Copyright © 2017 EAKit
//

#if os(macOS)
import Cocoa

// MARK: - Properties
public extension NSView {
	
	/// EAKit: Border color of view; also inspectable from Storyboard.
	@IBInspectable public var borderColor: NSColor? {
		get {
			guard let color = layer?.borderColor else { return nil }
			return NSColor(cgColor: color)
		}
		set {
			wantsLayer = true
			layer?.borderColor = newValue?.cgColor
		}
	}
	
	/// EAKit: Border width of view; also inspectable from Storyboard.
	@IBInspectable public var borderWidth: CGFloat {
		get {
			return layer?.borderWidth ?? 0
		}
		set {
			wantsLayer = true
			layer?.borderWidth = newValue
		}
	}
	
	/// EAKit: Corner radius of view; also inspectable from Storyboard.
	@IBInspectable public var cornerRadius: CGFloat {
		get {
			return layer?.cornerRadius ?? 0
		}
		set {
			wantsLayer = true
			layer?.masksToBounds = true
			layer?.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
		}
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
	
	/// EAKit: Shadow color of view; also inspectable from Storyboard.
	@IBInspectable public var shadowColor: NSColor? {
		get {
			guard let color = layer?.shadowColor else { return nil }
			return NSColor(cgColor: color)
		}
		set {
			wantsLayer = true
			layer?.shadowColor = newValue?.cgColor
		}
	}
	
	/// EAKit: Shadow offset of view; also inspectable from Storyboard.
	@IBInspectable public var shadowOffset: CGSize {
		get {
			return layer?.shadowOffset ?? CGSize.zero
		}
		set {
			wantsLayer = true
			layer?.shadowOffset = newValue
		}
	}
	
	/// EAKit: Shadow opacity of view; also inspectable from Storyboard.
	@IBInspectable public var shadowOpacity: Float {
		get {
			return layer?.shadowOpacity ?? 0
		}
		set {
			wantsLayer = true
			layer?.shadowOpacity = newValue
		}
	}
	
	/// EAKit: Shadow radius of view; also inspectable from Storyboard.
	@IBInspectable public var shadowRadius: CGFloat {
		get {
			return layer?.shadowRadius ?? 0
		}
		set {
			wantsLayer = true
			layer?.shadowRadius = newValue
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
	
	/// EAKit: Width of view.
	public var width: CGFloat {
		get {
			return frame.size.width
		}
		set {
			frame.size.width = newValue
		}
	}
	
}

// MARK: - Methods
extension NSView {
	
	/// EAKit: Add array of subviews to view.
	///
	/// - Parameter subviews: array of subviews to add to self.
	public func addSubviews(_ subviews: [NSView]) {
		subviews.forEach({self.addSubview($0)})
	}
	
	/// EAKit: Remove all subviews in view.
	public func removeSubviews() {
		subviews.forEach({$0.removeFromSuperview()})
	}
	
}

#endif
