//
//  StoryboardInstantiatable.swift
//  EAKit-iOS
//
//  Created by Meniny on 2018-05-12.
//

import UIKit

public enum StoryboardInstantiateType {
    case initial
    case identifier(String)
}

public protocol StoryboardInstantiatable {
    static var storyboardName: String { get }
    static var storyboardBundle: Bundle { get }
    static var instantiateType: StoryboardInstantiateType { get }
}

public extension StoryboardInstantiatable where Self: NSObject {
    public static var storyboardName: String {
        return typeName
    }
    
    public static var storyboardBundle: Bundle {
        return Bundle(for: self)
    }
    
    private static var storyboard: UIStoryboard {
        return UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    }
    
    public static var instantiateType: StoryboardInstantiateType {
        return .identifier(typeName)
    }
}

public extension StoryboardInstantiatable where Self: UIViewController {
    public static func instantiate() -> Self {
        switch instantiateType {
        case .initial:
            return storyboard.instantiateInitialViewController() as! Self
        case .identifier(let identifier):
            return storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        }
    }
}
