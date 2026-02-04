//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 01/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


public class CustomVariables: Codable, Context {
    
    /** A value which identifies the type of event. */
    public var eventType: String = "monetate:context:CustomVariables"
    /** An array of custom variables. */
    public var customVariables: [CustomVariablesModel]
    
    public init?(customVariables: [CustomVariablesModel]?) {
        guard let customVariables = customVariables else {
            return nil
        }
        self.customVariables = customVariables
    }
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? CustomVariables, isContextSwitched(val: val) {
            return true
        }
        return false
    }
    
    static func merge (first: [CustomVariablesModel], second: [CustomVariablesModel]) -> [CustomVariablesModel] {
        let merged = Array(Dictionary([first, second].joined().map { ($0.variable, $0)}, uniquingKeysWith: { $1 }).values)
        return merged
    }
}



public struct CustomVariablesModel: Codable {
    
    /** The name of the custom variable */
    public var variable: String
    /** The value of the custom variable */
    public var value: JSONValue
    
    public init(variable: String, value: JSONValue) {
        self.variable = variable
        self.value = value
    }
}


extension CustomVariablesModel: Equatable {
    public static func ==(lhs: CustomVariablesModel, rhs: CustomVariablesModel) -> Bool {
        if lhs.variable == rhs.variable && lhs.value == rhs.value {
            return true
        }
        return false
    }
}


extension CustomVariables: Equatable {
    public static func ==(lhs: CustomVariables, rhs: CustomVariables) -> Bool {
        if lhs.customVariables == rhs.customVariables {
            return true
        }
        return false
    }
    
    public func isContextSwitched(val: CustomVariables) -> Bool {
        for item2 in val.customVariables {
            for item1 in self.customVariables {
                if item1.variable == item2.variable && item1.value != item2.value {
                    return true
                } else if item1.variable != item2.variable && item1.value != item2.value {
                    return true
                }
            }
        }
        
        return false
    }
}
