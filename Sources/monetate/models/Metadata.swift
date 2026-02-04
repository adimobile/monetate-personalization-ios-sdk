//
//  Metadata.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 01/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public protocol MEvent {
    //   var eventType:String { get set }
}

public protocol Context: MEvent {
    func isContextSwitched(ctx: Context) -> Bool
}

public func ==<K, L: Hashable, R: Hashable>(lhs: [K: L], rhs: [K: R] ) -> Bool {
    (lhs as NSDictionary).isEqual(to: rhs)
}

public class Metadata: Codable, Context {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? Metadata, let dic1 = self.metadata.dictionary, let dic2 = val.metadata.dictionary {
            for (key, val) in dic2 {
                if let val2 = dic1[key], val2 != val {
                    return true
                }
            }
        }
        return false
    }
    
    public static func merge (first: JSONValue, second: JSONValue) -> JSONValue {
        if var dic1 = first.dictionary, let dic2 = second.dictionary {
            dic1.merge(dict: dic2)
            let p = dic1.map{($0.key, JSONValue.init(stringLiteral: $0.value as! String))}
            return JSONValue(dictionaryLiteral: p)
        }
        return first
    }
    
    
    
    /** A value which identifies the type of event. */
    public var eventType: String = "monetate:context:Metadata"
    /** Arbitrary additional custom data to be sent for action. */
    public var metadata: JSONValue
    
    public init(metadata: JSONValue) {
        self.metadata = metadata
    }
    
    public init(language: String) {
        self.metadata = [
            "language": .string(language)
        ]
    }
}

extension Encodable {
    var dictionary: [String: AnyHashable]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: AnyHashable] }
    }
}
