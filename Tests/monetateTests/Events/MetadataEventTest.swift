//
//  MetadataEventTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class MetadataEventTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMergeCase1 () {
        let val1 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-2", "val-2")))
        let val2 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-3", "val-3"), ("key-4", "val-4")))
        
        let json = Metadata.merge(first: val1.metadata, second: val2.metadata)
        guard let dic = json.dictionary else {return}
        XCTAssertTrue(dic.keys.count == 4, "Merging is failed, count should be 4")
    }
    
    func testMergeCase2 () {
        let val1 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-2", "val-2")))
        let val2 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-4", "val-4")))
        
        let json = Metadata.merge(first: val1.metadata, second: val2.metadata)
        guard let dic = json.dictionary else {return}
        XCTAssertTrue(dic.keys.count == 3, "Merging is failed, count should be 3")
    }
    
    func testIsFlushRequiredCase1 () {
        let val1 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-2", "val-2")))
        let val2 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-4", "val-4")))
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsFlushRequiredCase2 () {
        let val1 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-1"), ("key-2", "val-2")))
        let val2 = Metadata(metadata: JSONValue(dictionaryLiteral: ("key-1", "val-3"), ("key-4", "val-4")))
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
}

