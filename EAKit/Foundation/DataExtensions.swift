//
//  DataExtensions.swift
//  EAKit
//
//  Created by Elias Abel on 07/12/2016.
//  Copyright © 2016 EAKit
//

import Foundation

// MARK: - Properties
public extension Data {
	
	/// EAKit: Return data as an array of bytes.
	public var bytes: [UInt8] {
		// http://stackoverflow.com/questions/38097710/swift-3-changes-for-getbytes-method
		return [UInt8](self)
	}
	
}

// MARK: - Methods
public extension Data {
	
	/// EAKit: String by encoding Data using the given encoding (if applicable).
	///
	/// - Parameter encoding: encoding.
	/// - Returns: String by encoding Data using the given encoding (if applicable).
	public func string(encoding: String.Encoding) -> String? {
		return String(data: self, encoding: encoding)
	}
	
    /// Convert self UUID to String.
    ///
    /// Useful for push notifications.
    ///
    /// - Returns: Returns self as String from UUID.
    public func readableUUID() -> String {
        return self.description.trimmingCharacters(in: CharacterSet(charactersIn: "<>")).replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
    }
}

extension Data {
    
    public func write(to url: URL, withIntermediateDirectories createIntermediates: Bool, options: Data.WritingOptions = []) throws {
        
        let manager = FileManager.default
        
        let directory = url.deletingLastPathComponent()
        
        if !manager.fileExists(atPath: directory.path) {
            try manager.createDirectory(at: directory, withIntermediateDirectories: true, attributes: nil)
        }
        
        try self.write(to: url, options: options)
    }
}

public extension Data {
    public var toJson: Any? {
        do {
            let json = try JSONSerialization.jsonObject(with: self, options: [])
            return json
        } catch let error {
            print(error)
            return nil
        }
    }
    
    public var toJsonObject: [String: Any]? {
        return self.toJson as? [String: Any]
    }
}

extension Data {
    // http://stackoverflow.com/questions/39248092/nsattributedstring-extension-in-swift-3
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
