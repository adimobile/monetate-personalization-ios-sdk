//
//  PurchaseEventTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest

@testable import Monetate

class PurchaseEventTest: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMergeCase1 () {
        let val1 = Purchase.init(account: "Flipkart", domain: "com.whatsapp", instance: "instance-12", purchaseId: "ID-21313", purchaseLines: [
            PurchaseLine(sku: "SKU-111", pid: "PID-111", quantity: 1, currency: "USD", value: "111"),
            PurchaseLine(sku: "SKU-222", pid: "PID-222", quantity: 2, currency: "USD", value: "222")
        ])
        let val2 = Purchase.init(account: "Flipkart", domain: "com.whatsapp", instance: "instance-12", purchaseId: "ID-21313", purchaseLines: [
            PurchaseLine(sku: "SKU-333", pid: "PID-333", quantity: 3, currency: "USD", value: "333"),
            PurchaseLine(sku: "SKU-444", pid: "PID-444", quantity: 4, currency: "USD", value: "444")
        ])
        
        let array = Purchase.merge(first: val1.purchaseLines!, second: val2.purchaseLines!)
        XCTAssertTrue(array.count == 4, "Merging is failed, purchaseLines count should be 4")
    }
    
    func testMergeCase2 () {
        let val1 = Purchase.init(account: "Flipkart", domain: "com.whatsapp", instance: "instance-12", purchaseId: "ID-21313", purchaseLines: [
            PurchaseLine(sku: "SKU-111", pid: "PID-111", quantity: 1, currency: "USD", value: "111"),
            PurchaseLine(sku: "SKU-222", pid: "PID-222", quantity: 2, currency: "USD", value: "222")
        ])
        let val2 = Purchase.init(account: "Flipkart", domain: "com.whatsapp", instance: "instance-12", purchaseId: "ID-21313", purchaseLines: [
            PurchaseLine(sku: "SKU-333", pid: "PID-111", quantity: 3, currency: "USD", value: "333"),
            PurchaseLine(sku: "SKU-444", pid: "PID-444", quantity: 4, currency: "USD", value: "444")
        ])
        
        let array = Purchase.merge(first: val1.purchaseLines!, second: val2.purchaseLines!)
        XCTAssertTrue(array.count == 3, "Merging is failed, purchaseLines count should be 3")
    }
}
