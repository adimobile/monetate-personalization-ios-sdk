//
// JSONValue.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 01/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


public enum JSONValue: Codable, Equatable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case object([String: JSONValue])
    case array([JSONValue])
    case null
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let string): try container.encode(string)
        case .int(let int): try container.encode(int)
        case .double(let double): try container.encode(double)
        case .bool(let bool): try container.encode(bool)
        case .object(let object): try container.encode(object)
        case .array(let array): try container.encode(array)
        case .null: try container.encode(Optional<String>.none)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self = try ((try? container.decode(String.self)).map(JSONValue.string))
            .or((try? container.decode(Int.self)).map(JSONValue.int))
            .or((try? container.decode(Double.self)).map(JSONValue.double))
            .or((try? container.decode(Bool.self)).map(JSONValue.bool))
            .or((try? container.decode([String: JSONValue].self)).map(JSONValue.object))
            .or((try? container.decode([JSONValue].self)).map(JSONValue.array))
            .or((container.decodeNil() ? .some(JSONValue.null) : .none))
            .resolve(
                with: DecodingError.typeMismatch(
                    JSONValue.self,
                    DecodingError.Context(
                        codingPath: container.codingPath,
                        debugDescription: "Not a JSON value"
                    )
                )
            )
    }
    
}

// MARK: - JSONValue initializer from Any / Dictionary / Array
extension JSONValue {
    /// Initialize from any value recursively
    public init(_ value: Any) {
        switch value {
        case let v as String:
            self = .string(v)
        case let v as Int:
            self = .int(v)
        case let v as Double:
            self = .double(v)
        case let v as Bool:
            self = .bool(v)
        case let v as [Any]:
            self = .array(v.map { JSONValue($0) })
        case let v as [String: Any]:
            self = .object(v.mapValues { JSONValue($0) })
        default:
            self = .null
        }
    }
}

extension JSONValue: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self = .string(value)
    }
}
extension JSONValue: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = .int(value)
    }
}
extension JSONValue: ExpressibleByFloatLiteral {
    public init(floatLiteral value: Double) {
        self = .double(value)
    }
}
extension JSONValue: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: Bool) {
        self = .bool(value)
    }
}
extension JSONValue: ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, JSONValue)...) {
        self = .object([String: JSONValue](uniqueKeysWithValues: elements))
    }
    public init(dictionaryLiteral elements: [(String, JSONValue)]) {
        self = .object([String: JSONValue](uniqueKeysWithValues: elements))
    }
}
extension JSONValue: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: JSONValue...) {
        self = .array(elements)
    }
}

extension JSONValue {
    var isEmpty: Bool {
        switch self {
        case .string(let value):
            return value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        case .int(_), .double(_), .bool(_):
            return false // These always have a value
        case .object(let dict):
            return dict.isEmpty
        case .array(let array):
            return array.isEmpty
        case .null:
            return true
        }
    }
}

fileprivate extension Optional {
    func or(_ other: Optional) -> Optional {
        switch self {
        case .none: return other
        case .some: return self
        }
    }
    func resolve(with error: @autoclosure () -> Error) throws -> Wrapped {
        switch self {
        case .none: throw error()
        case .some(let wrapped): return wrapped
        }
    }
}
