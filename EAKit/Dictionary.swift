//
//  Dictionary.swift
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
//  Created by Elias Abel on 2018/1/8.
//  Copyright © 2018年 Meniny Lab. All rights reserved.
//

import Foundation

func += <K, V> (lhs: inout [K: V], rhs: [K: V]) {
    for (k, v) in rhs {
        lhs[k] = v
    }
}

func + <K, V> (lhs: [K: V], rhs: [K: V]) -> [K: V] {
    var result = lhs
    for (k, v) in rhs {
        result[k] = v
    }
    return result
}

public extension Dictionary {
    /// Array of all keys
    public var allKeys: [Key] {
        return keys.map({ (k) -> Key in
            return k
        })
    }
    
    /// Array of all values
    public var allValues: [Value] {
        return values.map({ (v) -> Value in
            return v
        })
    }
}

