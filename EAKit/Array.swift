//
//  Array.swift
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

public extension Array {
    public mutating func prepend(_ element: Element) {
        self.insert(element, at: 0)
    }
    
    public mutating func prepend(contentsOf: [Element]) {
        forEach { (e) in
            self.prepend(e)
        }
    }
}

public extension Array where Element: Equatable {
    /// Get an element at specific index
    ///
    /// - Parameter index: The index
    /// - Returns: The element, return `nil` if the index is out of bouds
    public func element(at index: Int) -> Element? {
        guard !self.isEmpty && index >= 0 && index < self.count else {
            return nil
        }
        return self[index]
    }
    
    /// Get a collection of elements at specific indexes
    ///
    /// - Parameter range: The range of indexes
    /// - Returns: The elements array
    public func elements(in range: CountableRange<Int>) -> [Element] {
//        guard !self.isEmpty else {
//            return []
//        }
        var result = [Element]()
        for i in range {
            guard let element = self.element(at: i) else {
                continue
            }
            result.append(element)
        }
        return result
    }
}

public extension Array where Element: Equatable {
    
    public mutating func remove(_ element: Element) {
        if let index = self.index(of: element) {
            self.remove(at: index)
        }
    }
    
    public mutating func remove(in array: [Element]) {
        for element in array {
            self.remove(element)
        }
    }
    
    public mutating func removeLast() {
        guard let e = self.last else {
            return
        }
        self.remove(e)
    }
    
    public mutating func removeFirst() {
        guard let e = self.first else {
            return
        }
        self.remove(e)
    }
}

/// append to array
public func + <T> (lhs: [T], rhs: T) -> [T] {
    return lhs + [rhs]
}

/// append to array
public func + <T> (lhs: [T], rhs: [T]) -> [T] {
    var cp = lhs
    cp.append(contentsOf: rhs)
    return cp
}

/// append to array
public func += <T> (lhs: inout [T], rhs: T) {
    lhs.append(rhs)
}

/// append to array
public func += <T> (lhs: inout [T], rhs: [T]) {
    lhs.append(contentsOf: rhs)
}

