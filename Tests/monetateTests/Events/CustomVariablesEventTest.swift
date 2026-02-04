//
//  CustomVariablesTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//
import XCTest
@testable import Monetate

class CustomVariablesEventTest: XCTestCase {
    
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMergeCase1 () {
        let var1 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
            CustomVariablesModel(variable: "Variable-2", value: JSONValue(stringLiteral: "Value-2"))
        ])
        let var2 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-4", value: JSONValue(stringLiteral: "Value-4")),
            CustomVariablesModel(variable: "Variable-3", value: JSONValue(stringLiteral: "Value-3"))
        ])
        
        let array = CustomVariables.merge(first: var1.customVariables, second: var2.customVariables)
        XCTAssertTrue(array.count == 4, "Merging is failed, count should be 4")
    }
    
    func testMergeCase2 () {
        let var1 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
            CustomVariablesModel(variable: "Variable-2", value: JSONValue(stringLiteral: "Value-2"))
        ])
        let var2 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
            CustomVariablesModel(variable: "Variable-3", value: JSONValue(stringLiteral: "Value-3"))
        ])
        
        let array = CustomVariables.merge(first: var1.customVariables, second: var2.customVariables)
        XCTAssertTrue(array.count == 3, "Merging is failed, count should be 3")
    }
    
//    func testIsFlushRequiredCase1 () {
//        let var1 = CustomVariables(customVariables: [
//            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
//            CustomVariablesModel(variable: "Variable-2", value: JSONValue(stringLiteral: "Value-2"))
//        ])
//        let var2 = CustomVariables(customVariables: [
//            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
//            CustomVariablesModel(variable: "Variable-3", value: JSONValue(stringLiteral: "Value-3"))
//        ])
//        let result = var1.isContextSwitched(ctx: var2)
//        XCTAssertTrue(result == false, "Flush was not required")
//    }
    
    func testIsFlushRequiredCase2 () {
        let var1 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-1")),
            CustomVariablesModel(variable: "Variable-2", value: JSONValue(stringLiteral: "Value-2"))
        ])
        let var2 = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "Variable-1", value: JSONValue(stringLiteral: "Value-3")),
            CustomVariablesModel(variable: "Variable-3", value: JSONValue(stringLiteral: "Value-1"))
        ])
        let result = var1.isContextSwitched(ctx: var2)
        XCTAssertTrue(result == true, "Merging is required")
    }
    
}
