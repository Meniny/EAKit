//
//  CGSizeExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 8/22/16.
//  Copyright © 2016 EAKit
//

#if os(macOS)
	import Cocoa
#else
	import UIKit
#endif

// MARK: - Methods
public extension CGSize {
	
	/// EAKit: Aspect fit CGSize.
	///
	///     let rect = CGSize(width: 120, height: 80)
	///     let parentRect  = CGSize(width: 100, height: 50)
	///     let newRect = rect.aspectFit(to: parentRect)
	///     //newRect.width = 75 , newRect = 50
	///
	/// - Parameter boundingSize: bounding size to fit self to.
	/// - Returns: self fitted into given bounding size
	public func aspectFit(to boundingSize: CGSize) -> CGSize {
		let minRatio = min(boundingSize.width / width, boundingSize.height / height)
		return CGSize(width: width * minRatio, height: height * minRatio)
	}
	
	/// EAKit: Aspect fill CGSize.
	///
	///     let rect = CGSize(width: 20, height: 120)
	///     let parentRect  = CGSize(width: 100, height: 60)
	///     let newRect = rect.aspectFit(to: parentRect)
	///     //newRect.width = 100 , newRect = 60
	///
	/// - Parameter boundingSize: bounding size to fill self to.
	/// - Returns: self filled into given bounding size
	public func aspectFill(to boundingSize: CGSize) -> CGSize {
		let minRatio = max(boundingSize.width / width, boundingSize.height / height)
		let w = min(width * minRatio, boundingSize.width)
		let h = min(height * minRatio, boundingSize.height)
		return CGSize(width: w, height: h)
	}
	
}
