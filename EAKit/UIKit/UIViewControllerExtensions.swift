//
//  UIViewControllerExtensions.swift
//  EAKit
//
//  Created by Emirhan Erdogan on 07/08/16.
//  Copyright © 2016 EAKit
//

#if os(iOS) || os(tvOS)
    import UIKit

    // MARK: - Properties
    public extension UIViewController {
        
        /// EAKit: Check if ViewController is onscreen and not hidden.
        public var isVisible: Bool {
            // http://stackoverflow.com/questions/2777438/how-to-tell-if-uiviewcontrollers-view-is-visible
            return self.isViewLoaded && view.window != nil
        }
        
    }

    // MARK: - Methods
    public extension UIViewController {
        
        /// EAKit: Assign as listener to notification.
        ///
        /// - Parameters:
        ///   - name: notification name.
        ///   - selector: selector to run with notified.
        public func addNotificationObserver(name: Notification.Name, selector: Selector) {
            NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
        }
        
        /// EAKit: Unassign as listener to notification.
        ///
        /// - Parameter name: notification name.
        public func removeNotificationObserver(name: Notification.Name) {
            NotificationCenter.default.removeObserver(self, name: name, object: nil)
        }
        
        /// EAKit: Unassign as listener from all notifications.
        public func removeNotificationsObserver() {
            NotificationCenter.default.removeObserver(self)
        }
        
        /// EAKit: Helper method to display an alert on any UIViewController subclass. Uses UIAlertController to show an alert
        ///
        /// - Parameters:
        ///   - title: title of the alert
        ///   - message: message/body of the alert
        ///   - buttonTitles: (Optional)list of button titles for the alert. Default button i.e "OK" will be shown if this paramter is nil
        ///   - highlightedButtonIndex: (Optional) index of the button from buttonTitles that should be highlighted. If this parameter is nil no button will be highlighted
        ///   - completion: (Optional) completion block to be invoked when any one of the buttons is tapped. It passes the index of the tapped button as an argument
        /// - Returns: UIAlertController object (discardable).
        @discardableResult public func showAlert(title: String?, message: String?, buttonTitles: [String]? = nil, highlightedButtonIndex: Int? = nil, completion: ((Int) -> Void)? = nil) -> UIAlertController {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            var allButtons = buttonTitles ?? [String]()
            if allButtons.count == 0 {
                allButtons.append("OK")
            }
            
            for index in 0..<allButtons.count {
                let buttonTitle = allButtons[index]
                let action = UIAlertAction(title: buttonTitle, style: .default, handler: { (_) in
                    completion?(index)
                })
                alertController.addAction(action)
                // Check which button to highlight
                if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                    if #available(iOS 9.0, *) {
                        alertController.preferredAction = action
                    }
                }
            }
            present(alertController, animated: true, completion: nil)
            return alertController
        }
    }
    
    public extension UIViewController {
        public var extendedLayout: Bool {
            set {
                extendedLayoutIncludesOpaqueBars = !newValue
                edgesForExtendedLayout = newValue ? .all : []
            }
            get {
                return edgesForExtendedLayout != []
            }
        }
    }
    
    public extension UIViewController {
        
        public class func instance(storyboard sbname: String, bundle: Bundle? = nil, identifier: String?) -> Self {
            return helper_instance(storyboard: sbname, bundle: bundle, identifier: identifier)
        }
        
        public class func sb(_ sbname: String, bundle: Bundle? = nil, id: String?) -> Self {
            return helper_instance(storyboard: sbname, bundle: bundle, identifier: id)
        }
        
        private class func helper_instance<T>(storyboard sbname: String, bundle: Bundle?, identifier: String?) -> T {
            let storyboard = UIStoryboard.init(name: sbname, bundle: bundle)
            guard let id = identifier else {
                return storyboard.instantiateInitialViewController() as! T
            }
            return storyboard.instantiateViewController(withIdentifier: id) as! T
        }
    }
#endif
