//
//  LanguageTest.swift
//  monetate-ios-sdkTests
//
//  Created by Rajan Marathe on 13/10/23.
//  Copyright © 2023 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

final class LanguageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsFlushNotRequired () {
        let val1 = Language(language: "en-US")
        let val2 = Language(language: "en-US")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsFlushRequired () {
        let val1 = Language(language: "en-US")
        let val2 = Language(language: "en-IN")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
}
