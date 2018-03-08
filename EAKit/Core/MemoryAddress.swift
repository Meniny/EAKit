//
//  MemoryAddress.swift
//  EAKit-iOS
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
//  Created by Elias Abel on 2018/3/8.
//  
//

import Foundation

///
/// To print the memory address in LLDB, use `frame variable -L OBJ`.
/// e.g. You have:
///
/// ```
/// var str = "This is a sample string."
/// ```
///
/// In LLDB:
///
/// ```
/// frame variable -L str
/// ```
public struct MemoryAddress<T>: CustomStringConvertible {
    
    public let intValue: Int
    
    public var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }
    
    // for structures
    public init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

public extension MemoryAddress  {
    
    // for classes
    public init(of classInstance: T) {
        intValue = unsafeBitCast(classInstance, to: Int.self)
        // or:
        // intValue = Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}

public func address<T>(of structPointer: UnsafePointer<T>) -> MemoryAddress<T> {
    return MemoryAddress(of: structPointer)
}

public func address<T>(of classInstance: T) -> MemoryAddress<T> {
    return MemoryAddress(of: classInstance)
}
