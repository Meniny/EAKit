//
//  UIFontExtensions.swift
//  EAKit 
//
//  Created by Benjamin Meyer on 9/16/17.
//  Copyright © 2017 EAKit
//

#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit

// MARK: - Properties
public extension UIFont {
    
    /// EAKit: Font as bold font
    public var bold: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitBold)!, size: 0)
    }
    
    /// EAKit: Font as italic font
    public var italic: UIFont {
        return UIFont(descriptor: fontDescriptor.withSymbolicTraits(.traitItalic)!, size: 0)
    }
	
	/// EAKit: Font as monospaced font
	///
	///     UIFont.preferredFont(forTextStyle: .body).monospaced
	///
	public var monospaced: UIFont {
		let settings = [[UIFontDescriptor.FeatureKey.featureIdentifier: kNumberSpacingType, UIFontDescriptor.FeatureKey.typeIdentifier: kMonospacedNumbersSelector]]
		
		let attributes = [UIFontDescriptor.AttributeName.featureSettings: settings]
		let newDescriptor = fontDescriptor.addingAttributes(attributes)
		return UIFont(descriptor: newDescriptor, size: 0)
	}
	
}
#endif
