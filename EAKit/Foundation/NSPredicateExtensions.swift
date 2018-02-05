//
//  NSPredicateExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 04.10.17.
//  Copyright © 2017 EAKit
//

import Foundation

// MARK: - Properties
public extension NSPredicate {
	
	/// EAKit: Returns a new predicate formed by NOT-ing the predicate.
	public var not: NSCompoundPredicate {
		return NSCompoundPredicate(notPredicateWithSubpredicate: self)
	}
	
}

// MARK: - Methods
public extension NSPredicate {
	
	/// EAKit: Returns a new predicate formed by AND-ing the argument to the predicate.
	///
	/// - Parameter predicate: NSPredicate
	/// - Returns: NSCompoundPredicate
	public func and(_ predicate: NSPredicate) -> NSCompoundPredicate {
		return NSCompoundPredicate(andPredicateWithSubpredicates: [self, predicate])
	}
	
	/// EAKit: Returns a new predicate formed by OR-ing the argument to the predicate.
	///
	/// - Parameter predicate: NSPredicate
	/// - Returns: NSCompoundPredicate
	public func or(_ predicate: NSPredicate) -> NSCompoundPredicate {
		return NSCompoundPredicate(orPredicateWithSubpredicates: [self, predicate])
	}
	
}

// MARK: - Operators
public extension NSPredicate {
	
	/// EAKit: Returns a new predicate formed by NOT-ing the predicate.
	/// - Parameters: rhs: NSPredicate to convert.
	/// - Returns: NSCompoundPredicate
	static public prefix func ! (rhs: NSPredicate) -> NSCompoundPredicate {
		return rhs.not
	}
	
	/// EAKit: Returns a new predicate formed by AND-ing the argument to the predicate.
	///
	/// - Parameters:
	///   - lhs: NSPredicate.
	///   - rhs: NSPredicate.
	/// - Returns: NSCompoundPredicate
	static public func + (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
		return lhs.and(rhs)
	}
	
	/// EAKit: Returns a new predicate formed by OR-ing the argument to the predicate.
	///
	/// - Parameters:
	///   - lhs: NSPredicate.
	///   - rhs: NSPredicate.
	/// - Returns: NSCompoundPredicate
	static public func | (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
		return lhs.or(rhs)
	}
	
	/// EAKit: Returns a new predicate formed by remove the argument to the predicate.
	///
	/// - Parameters:
	///   - lhs: NSPredicate.
	///   - rhs: NSPredicate.
	/// - Returns: NSCompoundPredicate
	static public func - (lhs: NSPredicate, rhs: NSPredicate) -> NSCompoundPredicate {
		return lhs + !rhs
	}
	
}
