
#if !os(watchOS)
    #if os(OSX)
        import Cocoa
    #else
        import Foundation
        import UIKit
    #endif

    public typealias Device = UIDevice

    public extension Device {
        
        public static func isPhone() -> Bool {
            return Device().userInterfaceIdiom == .phone
        }
        
        public static func isPad() -> Bool {
            return Device().userInterfaceIdiom == .pad
        }
        
        @available(iOS 9.0, *)
        public static func isTV() -> Bool {
            return Device().userInterfaceIdiom == .tv
        }
        
        @available(iOS 9.0, *)
        public static func isCar() -> Bool {
            return Device().userInterfaceIdiom == .carPlay
        }
        
        public static func isMacintosh() -> Bool {
            #if os(OSX)
                return true
            #else
                return false
            #endif
        }
        
        /*
         public static func isLinux() -> Bool {
         #if os(Linux)
         return true
         #else
         return false
         #endif
         }*/
        #if os(OSX)
        public static func isSimulator() -> Bool {
            return Simulator.isRunning
        }
        #endif
        
        public var alphanumericSystemVersion: String? {
            return try? sysctlString(levels: CTL_KERN, KERN_OSVERSION)
        }
    }
#endif
