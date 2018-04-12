//
//  EALog.swift
//  EAKit

import Foundation

public enum EALogType: String {
    case debug   = "DEBUG"
    case error   = "ERROR"
    case info    = "INFOMATION"
    case warning = "WARNING"
    case dumping = "DUMPING"
    
    public var emoji: String {
        switch self {
        case .debug:   return "💬"
        case .error:   return "❌"
        case .info:    return "ℹ️"
        case .warning: return "⚠️"
        case .dumping: return "🆔"
        }
    }
}

public let EALogDefaultSeparator = "\n"

// MARK: - Global functions
/// Exenteds NSLog.
///
/// Activate it by setting BFLogActive variable to true before using it.
internal func _log(_ type: EALogType, _ items: [Any?], dump: Bool, separator: String, filename: String, function: StaticString, line: Int) -> String {
    let file = URL.init(fileURLWithPath: filename).lastPathComponent
    let now = Date.init()
    let timestamp = Int(now.timeIntervalSince1970)
    let dateFormatter = DateFormatter.init()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    let dateString = dateFormatter.string(from: now)
    let log = [
        "▷ [\(type.emoji)] \(type.rawValue)",
        "▷ [📆] \(dateString) (\(timestamp))",
        "▷ [📋] \(file) :\(line)",
        "▷ [🔎] \(function)",
    ].joined(separator: "\n")
    let message = items.map({ (i) -> String in
        guard let i = i else { return "nil" }
        if dump {
            return dumper(i)
        }
        return String.init(describing: i)
    }).joined(separator: separator)
    let sep = "-------------------"
    let res = [sep, log, message, sep].joined(separator: "\n")
    print(res)
    return res
}
public struct EALog {
    #if DEBUG
        public static var isEnabled: Bool = true
    #else
        public static var isEnabled: Bool = false
    #endif
    
    /// Exenteds NSLog with a warning sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    @discardableResult
    public static func warning(_ items: Any?..., separator: String = EALogDefaultSeparator, filename: String = #file, function: StaticString = #function, line: Int = #line) -> String {
        if EALog.isEnabled {
            return _log(.warning, items, dump: false, separator: separator, filename: filename, function: function, line: line)
        }
        return ""
    }
    
    /// Exenteds NSLog with an error sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    @discardableResult
    public static func error(_ items: Any?..., separator: String = EALogDefaultSeparator, filename: String = #file, function: StaticString = #function, line: Int = #line) -> String {
        if EALog.isEnabled {
            return _log(.error, items, dump: false, separator: separator, filename: filename, function: function, line: line)
        }
        return ""
    }
    
    /// Exenteds NSLog with a debug sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    @discardableResult
    public static func debug(_ items: Any?..., separator: String = EALogDefaultSeparator, filename: String = #file, function: StaticString = #function, line: Int = #line) -> String {
        if EALog.isEnabled {
            return _log(.debug, items, dump: false, separator: separator, filename: filename, function: function, line: line)
        }
        return ""
    }
    
    /// Exenteds NSLog with an info sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    @discardableResult
    public static func info(_ items: Any?..., separator: String = EALogDefaultSeparator, filename: String = #file, function: StaticString = #function, line: Int = #line) -> String {
        if EALog.isEnabled {
            return _log(.info, items, dump: false, separator: separator, filename: filename, function: function, line: line)
        }
        return ""
    }
    
    /// Exenteds NSLog with an info sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    @discardableResult
    public static func dump(_ items: Any?..., separator: String = EALogDefaultSeparator, filename: String = #file, function: StaticString = #function, line: Int = #line) -> String {
        if EALog.isEnabled {
            return _log(.dumping, items, dump: true, separator: separator, filename: filename, function: function, line: line)
        }
        return ""
    }
}
