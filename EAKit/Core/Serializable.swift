//
//  Serializable.swift
//  EAKit-iOS
//
//  Created by Meniny on 2018-05-12.
//

import Foundation
#if os(iOS)
import UIKit
#endif

open class Serializer<Original, Serialized> {
    
    public init() {}
    
    public func serialize(_ original: Original) -> Serialized? {
        return original as? Serialized
    }
    
    public func serialize(_ original: Original, completion: (Serialized?) -> Void) {
        completion(serialize(original))
    }
}

#if os(iOS)
open class UIImageDataSerializer: Serializer<Data, UIImage> {
    public override func serialize(_ original: Data) -> UIImage? {
        return UIImage.init(data: original)
    }
}
#endif

open class StringDataSerializer: Serializer<Data, String> {
    public override func serialize(_ original: Data) -> String? {
        return String.init(data: original, encoding: .utf8)
    }
}

open class JSONDataSerializer: Serializer<Data, Any> {
    public override func serialize(_ original: Data) -> Any? {
        return try? JSONSerialization.jsonObject(with: original, options: [])
    }
}

open class JSONStringSerializer: Serializer<String, Any> {
    public override func serialize(_ original: String) -> Any? {
        guard let data = original.data(using: .utf8) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: [])
    }
}

open class CodableDataSerializer<T: Codable>: Serializer<Data, T> {
    public override func serialize(_ original: Data) -> T? {
        return try? JSONDecoder().decode(T.self, from: original)
    }
}

open class CodableStringSerializer<T: Codable>: Serializer<String, T> {
    public override func serialize(_ original: String) -> T? {
        guard let data = original.data(using: .utf8) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
