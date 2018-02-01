
#if os(OSX)
    import Cocoa
    /// Notify at NotificationCenter
    ///
    /// - Parameters:
    ///   - title: title string
    ///   - informative: optional message string
    ///   - image: optional image object
    ///   - sound: optional sound name string
    ///   - identifier: this identifier is used to uniquely identify a notification. A notification delivered with the same identifier as an existing notification will replace that notification, rather then display a new one. useless befor OS X 10.9
    ///   - delegate: NSUserNotificationCenterDelegate
    @discardableResult public func notify(
        title: String,
        informative: String? = nil,
        image: NSImage? = nil,
        sound: String? = NSUserNotificationDefaultSoundName,
        identifier: String? = nil,
        delegate: NSUserNotificationCenterDelegate? = nil) -> NSUserNotification {
        
        let notification: NSUserNotification = NSUserNotification()
        let notificationCenter = NSUserNotificationCenter.default
        notificationCenter.delegate = delegate
        notification.title = title
        notification.informativeText = informative
        notification.soundName = sound
        if #available(OSX 10.9, *) {
            notification.contentImage = image
            notification.identifier = identifier
        }
        notificationCenter.scheduleNotification(notification)
        return notification
    }
    
    public extension NSUserNotification {
        
    }
#endif
