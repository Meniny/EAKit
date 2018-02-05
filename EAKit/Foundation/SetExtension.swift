//
//  SetExtension.swift
//  EAKit
//

import Foundation

// MARK: - Set extension

/// This extension adds some useful functions to Set.
public extension Set {
    /// Randomly selects an element from self and returns it.
    ///
    /// - returns: An element that was randomly selected from the set.
    public func random() -> Element {
        return self[self.index(self.startIndex, offsetBy: randomInt(range: 0...self.count - 1))]
    }
}
