//
//  ReferrerTest.swift
//  monetate-ios-sdkTests
//
//  Created by Rajan Marathe on 12/10/23.
//  Copyright © 2023 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

final class ReferrerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsFlushNotRequired () {
        let val1 = Referrer(referrer: "www.amazon.in")
        let val2 = Referrer(referrer: "www.amazon.in")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsFlushRequired () {
        let val1 = Referrer(referrer: "www.amazon.in")
        let val2 = Referrer(referrer: "www.flipkart.com")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
}
