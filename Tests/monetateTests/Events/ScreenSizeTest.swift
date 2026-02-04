//
//  ScreenSizeTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest

@testable import Monetate

class ScreenSizeTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testIsFlushNotRequired () {
        let val1 = ScreenSize(height: Device.getDeviceSize().height.intValue, width: Device.getDeviceSize().width.intValue)
        let val2 = ScreenSize(height: Device.getDeviceSize().height.intValue, width: Device.getDeviceSize().width.intValue)
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == false, "Flush was not required")
    }
    
    func testIsFlushRequired () {
        let val1 = ScreenSize(height: Device.getDeviceSize().height.intValue, width: Device.getDeviceSize().width.intValue)
        let val2 = ScreenSize(height: 1024, width: 900)
        
        let result = val1.isContextSwitched(ctx: val2)
        XCTAssertTrue(result == true, "Flush was required")
    }
    
}
