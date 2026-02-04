//
//  CartEventTest1.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class CartEventTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMergeCase1 () {
        let val1 = Cart(cartLines: [
            CartLine(sku: "SKU-111", pid: "PID-111", quantity: 1, currency: "USD", value: "111"),
            CartLine(sku: "SKU-333", pid: "PID-333", quantity: 3, currency: "USD", value: "333")
        ])
        let val2 = Cart(cartLines: [
            CartLine(sku: "SKU-222", pid: "PID-222", quantity: 2, currency: "USD", value: "222"),
            CartLine(sku: "SKU-444", pid: "PID-444", quantity: 4, currency: "USD", value: "444")
        ])
        
        let array = Cart.merge(first: val1.cartLines!, second: val2.cartLines!)
        XCTAssertTrue(array.count == 4, "Merging is failed, cartlines count should be 4")
    }
    
    func testMergeCase2 () {
        let val1 = Cart(cartLines: [
            CartLine(sku: "SKU-111", pid: "PID-111", quantity: 1, currency: "USD", value: "111"),
            CartLine(sku: "SKU-333", pid: "PID-333", quantity: 3, currency: "USD", value: "333")
        ])
        let val2 = Cart(cartLines: [
            CartLine(sku: "SKU-222", pid: "PID-111", quantity: 2, currency: "USD", value: "222"),
            CartLine(sku: "SKU-444", pid: "PID-444", quantity: 4, currency: "USD", value: "444")
        ])
        
        let array = Cart.merge(first: val1.cartLines!, second: val2.cartLines!)
        XCTAssertTrue(array.count == 3, "Merging is failed, cartlines count should be 3")
    }
    
}
