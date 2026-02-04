//
//  Action1Test.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class ActionTest: XCTestCase {
    
    private var actionJson: [String: Any]!
    
    override func setUp() {
        super.setUp()
        let actionId = "12345"
        let actionType = "monetate:action:OmnichannelJson"
        let component = "testComponent"
        let impressionId = "67890"
        
        let json = ["type": "monetate:action:GenericAction"]
        
        self.actionJson = [
            "actionId": actionId,
            "actionType": actionType,
            "component": component,
            "impressionId": impressionId,
            "json": json
        ]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitFromJson () {
        let action = Action(json: self.actionJson)
        
        XCTAssertTrue(action.actionId == self.actionJson["actionId"] as? String, "Action id is not matched")
        XCTAssertTrue(action.actionType == self.actionJson["actionType"] as? String, "Action Type is not matched")
        XCTAssertTrue(action.component == self.actionJson["component"] as? String, "Component is not matched")
        XCTAssertTrue(action.impressionId == self.actionJson["impressionId"] as? String, "Impression Id is not matched")
        
        guard let json = self.actionJson["json"] as? [String:Any] else {return}
        guard let type = json["type"] as? String else {return}
        XCTAssertTrue(action.type == type)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
