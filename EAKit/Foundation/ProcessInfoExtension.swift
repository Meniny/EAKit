//
//  ProcessInfoExtension.swift
//  EAKit
//

import Foundation

// MARK: - ProcessInfo extension

/// This extesion adds some useful functions to ProcessInfo.
public extension ProcessInfo {
    /// Returns system uptime.
    ///
    /// - Returns: eturns system uptime.
    public static func uptime() -> TimeInterval {
        return ProcessInfo.processInfo.systemUptime
    }
    
    /// Returns sysyem uptime as Date.
    ///
    /// - Returns: Returns sysyem uptime as Date.
    public static func uptimeDate() -> Date {
        return Date(timeIntervalSinceNow: -uptime())
    }
}
