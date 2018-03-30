//
//  Codable.swift
//  EAKit
//
//  Blog  : https://meniny.cn
//  Github: https://github.com/Meniny
//
//  No more shall we pray for peace
//  Never ever ask them why
//  No more shall we stop their visions
//  Of selfdestructing genocide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  Screams of terror, panic spreads
//  Bombs are raining from the sky
//  Bodies burning, all is dead
//  There's no place left to hide
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  (A voice was heard from the battle field)
//
//  "Couldn't care less for a last goodbye
//  For as I die, so do all my enemies
//  There's no tomorrow, and no more today
//  So let us all fade away..."
//
//  Upon this ball of dirt we lived
//  Darkened clouds now to dwell
//  Wasted years of man's creation
//  The final silence now can tell
//  Dogs on leads march to war
//  Go ahead end it all...
//
//  Blow up the world
//  The final silence
//  Blow up the world
//  I don't give a damn!
//
//  When I wrote this code, only I and God knew what it was.
//  Now, only God knows!
//
//  So if you're done trying 'optimize' this routine (and failed),
//  please increment the following counter
//  as a warning to the next guy:
//
//  total_hours_wasted_here = 0
//
//  Created by Elias Abel on 2018/1/19.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import Foundation

public extension Decodable {
    /// Instance from JSON string
    ///
    /// - Parameters:
    ///   - jsonString: JSON string
    ///   - stringEncoding: Encoding
    /// - Returns: A model instance, return `nil` if failed
    public static func decode(from jsonString: String, using stringEncoding: String.Encoding) -> Self? {
        guard let jsonData = jsonString.data(using: stringEncoding) else {
            return nil
        }
        guard let jsonObject = (try? JSONSerialization.jsonObject(with: jsonData, options: [])) as? [String: Any] else {
            return nil
        }
        return self.decode(from: jsonObject)
    }
    
    /// Instance from JSON object
    ///
    /// - Parameters:
    ///   - jsonObject: JSON object
    /// - Returns: A model instance, return `nil` if failed
    public static func decode(from jsonObject: [String: Any]) -> Self? {
        do {
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
            return try JSONDecoder().decode(self, from: data)
        } catch let error {
            print(error)
        }
        return nil
    }
    
    /// Instance from JSON object
    ///
    /// - Parameters:
    ///   - data: JSON data
    /// - Returns: A model instance, return `nil` if failed
    public static func decode(from data: Data) -> Self? {
        do {
            return try JSONDecoder().decode(self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
}

public extension Encodable {
    
    public var encoded: Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            print(error)
            return nil
        }
    }
    
    /// To JSON string
    public var jsonify: String? {
        if let data = (self as? Data) {
            if let str = String.init(data: data, encoding: .utf8) {
                return str
            }
        }
        
        guard let encodedData = self.encoded else {
            return nil
        }
        return String.init(data: encodedData, encoding: .utf8)
    }
}
