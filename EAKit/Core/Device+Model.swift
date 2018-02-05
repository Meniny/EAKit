
#if !os(watchOS)
    #if os(OSX)
        import Cocoa
    #else
        import Foundation
        #if os(watchOS)
            import WatchKit
        #else
            import UIKit
        #endif
    #endif
    
    public struct Simulator {
        
        public static var isRunning: Bool = {
            #if (arch(i386) || arch(x86_64)) && !os(OSX) && !os(Linux)
                return true
            #else
                return false
            #endif
        }()
    }
    
    #if os(iOS)
        public extension UIDevice {
            public static var isSimulator: Bool {
                return Simulator.isRunning
            }
            
            public var isSimulator: Bool {
                return Simulator.isRunning
            }
        }
        
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
        }
    #endif

#endif
