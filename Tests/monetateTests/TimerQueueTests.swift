//
//  TimerQueueTests.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class TimerQueueTests : XCTestCase {
    
    //private var queue: [ContextEnum: MEvent] = [:]
    
    func testTimerPush () {
        var queue: [ContextEnum: MEvent] = [:]
        let userAgent1 = UserAgent(userAgent: "FireFox-2020")
        let userAgent2 = UserAgent(userAgent: "Chrome-2021")
        queue[.UserAgent] = userAgent1
        queue[.UserAgent] = userAgent2
        guard let item = queue[.UserAgent] as? UserAgent else {return}
        XCTAssertEqual(item.userAgent, "Chrome-2021", "Queue on push behavior is not working as expected")
    }
    
    func testTimerFlush () {
        var queue: [ContextEnum: MEvent] = [:]
        queue[.UserAgent] = UserAgent(userAgent: "FireFox-2020")
        queue[.ScreenSize] = ScreenSize(height: 1024, width: 900)
        let exp = XCTestExpectation(description: "Testing TimerbaseQueue for 5 seconds")
        let timer = ScheduleTimer(timeInterval: 5, callback: {
            queue = [:]
            exp.fulfill()
        })
        timer.resume()
        wait(for: [exp], timeout: 6)
        XCTAssertEqual(queue.count, 0, "Queue on push behavior is not working as expected")
    }
    
    func testTimer_5seconds () {
        
        let exp = XCTestExpectation(description: "Testing TimerbaseQueue for 5 seconds")
        let date1 = Date()
        let timer = ScheduleTimer(timeInterval: 5, callback: {
            exp.fulfill()
        })
        timer.resume()
        //      waitForExpectations(timeout: 8)
        wait(for: [exp], timeout: 6)
        let date2  = Date(timeIntervalSinceNow: -5).toString("E dd MM YY HH:mm:ss")
        print("Timer started - ", date1.toString("E dd MM YY HH:mm:ss"))
        print("Timer executed - ", date2)
        
        XCTAssertEqual(date1.toString("E dd MM YY HH:mm:ss"), date2, "timer not working correctly for 5 seconds")
    }
    
    func testTimer_15seconds () {
        
        let exp = XCTestExpectation(description: "Testing TimerbaseQueue for 15 seconds")
        let date1 = Date()
        let timer = ScheduleTimer(timeInterval: 15, callback: {
            exp.fulfill()
        })
        timer.resume()
        //      waitForExpectations(timeout: 8)
        wait(for: [exp], timeout: 16)
        let date2  = Date(timeIntervalSinceNow: -15).toString("E dd MM YY HH:mm:ss")
        print("Timer started - ", date1.toString("E dd MM YY HH:mm:ss"))
        print("Timer executed - ", date2)
        
        XCTAssertEqual(date1.toString("E dd MM YY HH:mm:ss"), date2, "timer not working correctly for 15 seconds")
    }
    
    func testTimer_30seconds () {
        
        let exp = XCTestExpectation(description: "Testing TimerbaseQueue for 30 seconds")
        let date1 = Date()
        let timer = ScheduleTimer(timeInterval: 30, callback: {
            exp.fulfill()
        })
        timer.resume()
        //      waitForExpectations(timeout: 8)
        wait(for: [exp], timeout: 31)
        let date2  = Date(timeIntervalSinceNow: -30).toString("E dd MM YY HH:mm:ss")
        print("Timer started - ", date1.toString("E dd MM YY HH:mm:ss"))
        print("Timer executed - ", date2)
        
        XCTAssertEqual(date1.toString("E dd MM YY HH:mm:ss"), date2, "timer not working correctly for 30 seconds")
    }
}
