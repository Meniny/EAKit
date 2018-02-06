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
    /// EAKit
    public enum UIFontType: String {
        case None = ""
        case Regular = "Regular"
        case Bold = "Bold"
        case DemiBold = "DemiBold"
        case Light = "Light"
        case UltraLight = "UltraLight"
        case Italic = "Italic"
        case Thin = "Thin"
        case Book = "Book"
        case Roman = "Roman"
        case Medium = "Medium"
        case MediumItalic = "MediumItalic"
        case CondensedMedium = "CondensedMedium"
        case CondensedExtraBold = "CondensedExtraBold"
        case SemiBold = "SemiBold"
        case BoldItalic = "BoldItalic"
        case Heavy = "Heavy"
    }

    /// EAKit
    public enum UIFontName: String {
        case HelveticaNeue
        case Helvetica
        case Futura
        case Menlo
        case Avenir
        case AvenirNext
        case Didot
        case AmericanTypewriter
        case Baskerville
        case Geneva
        case GillSans
        case SanFranciscoDisplay
        case Seravek
    }

    extension UIFont {
        
        /// EAKit
        public class func Font(_ name: UIFontName, type: UIFontType, size: CGFloat) -> UIFont! {
            //Using type
            let fontName = name.rawValue + "-" + type.rawValue
            if let font = UIFont(name: fontName, size: size) {
                return font
            }
            
            //That font doens't have that type, try .None
            let fontNameNone = name.rawValue
            if let font = UIFont(name: fontNameNone, size: size) {
                return font
            }
            
            //That font doens't have that type, try .Regular
            let fontNameRegular = name.rawValue + "-" + "Regular"
            if let font = UIFont(name: fontNameRegular, size: size) {
                return font
            }
            
            return nil
        }
        
        /// EAKit
        public class func helveticaNeue(type: UIFontType, size: CGFloat) -> UIFont {
            return Font(.HelveticaNeue, type: type, size: size)
        }
        
        /// EAKit
        public class func avenirNext(type: UIFontType, size: CGFloat) -> UIFont {
            return Font(.AvenirNext, type: type, size: size)
        }
        
        /// EAKit
        public class func avenirNextDemiBold(size: CGFloat) -> UIFont {
            return Font(.AvenirNext, type: .DemiBold, size: size)
        }
        
        /// EAKit
        public class func avenirNextRegular(size: CGFloat) -> UIFont {
            return Font(.AvenirNext, type: .Regular, size: size)
        }
    }
#endif
