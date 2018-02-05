//
//  BFLog.swift
//  BFKit
//
//  The MIT License (MIT)
//
//  Copyright (c) 2015 - 2017 Fabrizio Brancati. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

import Foundation

public enum EALogType: String {
    case debug   = "DEBUG"
    case error   = "ERROR"
    case info    = "INFOMATION"
    case warning = "WARNING"
    
    public var emoji: String {
        switch self {
        case .debug:   return "💬"
        case .error:   return "❗️"
        case .info:    return "ℹ️"
        case .warning: return "⚠️"
        }
    }
}

// MARK: - Global functions
/// Exenteds NSLog.
///
/// Activate it by setting BFLogActive variable to true before using it.
internal func _log(_ type: EALogType, _ items: [Any], filename: String, function: StaticString, line: Int) {
    #if !DEBUG
        var _message = message
        if _message.hasSuffix("\n") == false {
            _message += "\n"
        }
        
        let file = URL.init(fileURLWithPath: filename).lastPathComponent
        let now = Date.init()
        let timestamp = now.timestamp
        let time = now.format()
        let log = [
            "▷ \(type.emoji) \(type.rawValue)",
            "▷ \(time) (\(timestamp))",
            "▷ \(file): \(line)",
            "▷ \(function)",
            "▷ "
        ].joined(separator: "\n")
        let message = items.map({ (i) -> String in
            return String(i)
        }).joined(separator: "\n")
        print(log + "\n" + message)
    #endif
}
public struct EALog {
    /// Exenteds NSLog with a warning sign.
    ///
    /// Activate it by setting BFLogActive variable to true before using it.
    ///
    /// - Parameters:
    ///   - items: Console message.
    ///   - filename: File. Default is #file.
    ///   - function: Function name. Default is #function.
    ///   - line: Line number. Default is #line.
    public static func warning(_ items: Any..., filename: String = #file, function: StaticString = #function, line: Int = #line) {
        _log(.warning, items, filename: filename, function: function, line: line)
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
    public static func error(_ items: Any..., filename: String = #file, function: StaticString = #function, line: Int = #line) {
        _log(.error, items, filename: filename, function: function, line: line)
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
    public static func debug(_ items: Any..., filename: String = #file, function: StaticString = #function, line: Int = #line) {
        _log(.debug, items, filename: filename, function: function, line: line)
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
    public static func info(_ items: Any..., filename: String = #file, function: StaticString = #function, line: Int = #line) {
        _log(.info, items, filename: filename, function: function, line: line)
    }
}
