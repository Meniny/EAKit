//
//  UIView.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  Created by Elias Abel on 2017/12/28.
//  Copyright © 2017年 Meniny Lab. All rights reserved.
//

#if os(iOS)
    import Foundation
    import UIKit

    public extension UIView {
        
        public func addSubviews(_ views: UIView...) {
            addSubviews(views)
        }
        
        public func addSubviews(_ views: [UIView]) {
            views.forEach {
                addSubview($0)
            }
        }
        
        @discardableResult
        public func setBackgroundColor(_ hex: String?) -> Bool {
            guard let hex = hex, let color = UIColor.color(withHexString: hex) else {
                return false
            }
            self.backgroundColor = color
            return true
        }
    }
    
    public extension UIView {
        
        @IBInspectable public var shadowColor: CGColor? {
            get {
                return layer.shadowColor
            }
            set {
                layer.shadowColor = newValue
            }
        }
        
        @IBInspectable public var shadowOffset: CGSize {
            get {
                return layer.shadowOffset
            }
            set {
                layer.shadowOffset = newValue
            }
        }
        
        @IBInspectable public var shadowRadius: CGFloat {
            get {
                return layer.shadowRadius
            }
            set {
                layer.shadowRadius = newValue
            }
        }
        
        @IBInspectable public var shadowOpacity: Float {
            get {
                return layer.shadowOpacity
            }
            set {
                layer.shadowOpacity = newValue
            }
        }
        
        @IBInspectable public var cornerRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
                layer.masksToBounds = newValue > 0
            }
        }
        
        @IBInspectable public var borderWidth: CGFloat {
            get {
                return layer.borderWidth
            }
            set {
                layer.borderWidth = newValue
            }
        }
        
        @IBInspectable public var borderColor: UIColor? {
            get {
                guard let cg = self.layer.borderColor else {
                    return nil
                }
                return UIColor.init(cgColor: cg)
            }
            set {
                layer.borderColor = newValue?.cgColor
            }
        }
    }
#endif
