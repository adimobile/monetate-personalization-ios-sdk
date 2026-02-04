//
//  UserAgentTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class UserAgentTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsContextSwitched_NotRequired () {
        let val1 = UserAgent(userAgent: UAString())
        let val2 = UserAgent(userAgent: UAString())
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsContextSwitched_Required () {
        let val1 = UserAgent(userAgent: "Firefox-1111")
        let val2 = UserAgent(userAgent: "Firefox-2222")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
}
