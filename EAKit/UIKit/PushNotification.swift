
#if os(iOS)
    import Foundation
    import UIKit
    import UserNotifications

    public struct ApplePushNotification {
        
        public static var isEnabled: Bool {
            guard let settings = UIApplication.shared.currentUserNotificationSettings else {
                return false
            }
            
            return UIApplication.shared.isRegisteredForRemoteNotifications && !settings.types.isEmpty
        }
        
        public static var token: String?
        public static var registerFailed: Bool = false
        public static var userInfo: [AnyHashable : Any]?
        
        public static func setToken(data: Data) {
            let t = (data as NSData).description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
            token = t
        }
        
        @available(iOS 8.0, *)
        public static func register(types: UIUserNotificationType = [.sound, .alert, .badge], categories: Set<UIUserNotificationCategory>?) {
            let settings = UIUserNotificationSettings(types: types, categories: categories)
            UIApplication.shared.registerUserNotificationSettings(settings)
            UIApplication.shared.registerForRemoteNotifications()
        }
        
        @available(iOS 10.0, *)
        public static func register(options: UNAuthorizationOptions = [.sound, .alert, .badge], delegate: UNUserNotificationCenterDelegate?) {
            let center = UNUserNotificationCenter.current()
            center.delegate = delegate
            center.requestAuthorization(options: [ .badge, .sound, .alert ]) { success, error in
                if success {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                }
            }
        }
        
        @available(iOS, introduced: 3.0, deprecated: 8.0, message: "Deprecated at iOS 8.0")
        public static func register(types: UIRemoteNotificationType = [.sound, .alert, .badge]) {
            UIApplication.shared.registerForRemoteNotifications(matching: [.sound, .alert, .badge])
        }
    }

    public typealias APN = ApplePushNotification
#endif
