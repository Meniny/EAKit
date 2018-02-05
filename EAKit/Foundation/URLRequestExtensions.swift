//
//  URLRequestExtensions.swift
//  EAKit
//
//  Created by Omar Albeik on 9/5/17.
//  Copyright © 2017 EAKit
//

import Foundation

// MARK: - Initializers
public extension URLRequest {
	
	/// EAKit: Create URLRequest from URL string.
	///
	/// - Parameter urlString: URL string to initialize URL request from
	public init?(urlString: String) {
		guard let url = URL(string: urlString) else { return nil }
		self.init(url: url)
	}
	
}
