
#if os(OSX)
    import Cocoa

    public class UIDevice {
        
        public static let current: UIDevice = UIDevice()
        
        public var name: String {
            get {
                return Host.current().name ?? ""
            }
        }
        
        public var model: String {
            get {
                return (try? sysctlString(name: "hw.model")) ?? ""
            }
        }
        
        public var localizedModel: String {
            get {
                return model
            }
        }
        
        @available(OSX 10.10, *)
        public var systemName: String {
            get {
                // get major version
                if ProcessInfo.processInfo.operatingSystemVersion.majorVersion == 10 {
                    
                    // get minor version
                    let minorVersion = ProcessInfo.processInfo.operatingSystemVersion.minorVersion
                    
                    // figure out the name using versions
                    switch minorVersion {
                    case  11:
                        return "El Capitan"
                        
                    case 10:
                        
                        return "Yosemite"
                        
                    case 9:
                        return "Mavericks"
                        
                    case 8:
                        return "Mountain Lion"
                        
                    case 7:
                        return "Lion"
                        
                    case 6:
                        return "Snow Leopard"
                        
                    case 5:
                        return "Leopard"
                        
                    case 4:
                        return "Tiger"
                        
                    case 3:
                        return "Panther"
                        
                    case 2:
                        return "Jaguar"
                        
                    case 1:
                        return "Puma"
                        
                    case 0:
                        return "Kodiak"
                    default:
                        break
                    }
                }
                return ""
            }
        }
        
        public var systemVersion: String {
            get {
                return ProcessInfo.processInfo.operatingSystemVersionString
            }
        }
        
        public enum UIDeviceOrientation: UInt {
            case unknown
            case portrait            // Device oriented vertically, home button on the bottom
            case portraitUpsideDown  // Device oriented vertically, home button on the top
            case landscapeLeft       // Device oriented horizontally, home button on the right
            case landscapeRight      // Device oriented horizontally, home button on the left
            case faceUp              // Device oriented flat, face up
            case faceDown             // Device oriented flat, face down
        }
        
        public let orientation: UIDeviceOrientation = .unknown
        
        
        /// a UUID that may be used to uniquely identify the device, same across apps from a single vendor.
        public var identifierForVendor: UUID? {
            get {
                return UUID(uuidString: Bundle.main.bundleIdentifier ?? "")
            }
        }
        
        public let isGeneratingDeviceOrientationNotifications: Bool = false
        
        /// nestable
        public func beginGeneratingDeviceOrientationNotifications() {
            
        }
        
        public func endGeneratingDeviceOrientationNotifications() {
            
        }
        
        public var isBatteryMonitoringEnabled: Bool = false // default is NO
        
        public enum UIDeviceBatteryState: UInt {
            case unknown
            case unplugged   // on battery, discharging
            case charging    // plugged in, less than 100%
            case full        // plugged in, at 100%
        }              // available in iPhone 3.0

        public var batteryState: UIDeviceBatteryState = .unknown // UIDeviceBatteryStateUnknown if monitoring disabled
        
        public var batteryLevel: Float = 0 // 0 .. 1.0. -1.0 if UIDeviceBatteryStateUnknown
        
        public var isProximityMonitoringEnabled: Bool = false // default is NO
        
        public var proximityState: Bool = false // always returns NO if no proximity detector
        
        public let isMultitaskingSupported: Bool = true
        
        public enum UIUserInterfaceIdiom: Int {
            case unspecified = -1
            case phone // iPhone and iPod touch style UI
            case pad // iPad style UI
            case tv // Apple TV style UI
            case carPlay  // CarPlay style UI
        };
        
        public let userInterfaceIdiom: UIUserInterfaceIdiom = .unspecified
        
        /// Plays a click only if an enabling input view is on-screen and user has enabled input clicks.
        public func playInputClick() {
            
        }
    }
#endif
