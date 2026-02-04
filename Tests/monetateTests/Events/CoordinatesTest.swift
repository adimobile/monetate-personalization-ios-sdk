//
//  CoordinatesTest.swift
//  monetate-ios-sdkTests
//
//  Created by Rajan Marathe on 11/10/23.
//  Copyright © 2023 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

final class CoordinatesTest: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsFlushNotRequired () {
        let val1 = Coordinates(latitude: "30.2637508", longitude: "-97.8076735")
        let val2 = Coordinates(latitude: "30.2637508", longitude: "-97.8076735")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsFlushRequired () {
        let val1 = Coordinates(latitude: "30.2637508", longitude: "-97.8076735")
        let val2 = Coordinates(latitude: "30.2637508", longitude: "97.8076735")
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
}
