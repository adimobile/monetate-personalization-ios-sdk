//
//  ReportTests.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 23/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class PersonalizationTests: XCTestCase {
    
    final var personalization = Personalization(
        account: Account(instance: "p", domain: "localhost.org", name: "a-701b337c", shortname: "localhost"),
        user: User(monetateId: "2.1349157357.1736226061396", deviceId: "62bd2e2d-213d-463f-83bb-12c0b2530a14")
    )
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
//    func testReportCustomVariableEvent () {
//        let var1 = CustomVariables(customVariables: [CustomVariablesModel(variable: "Variable1", value: JSONValue(stringLiteral: "Value1")), CustomVariablesModel(variable: "Variable2", value: JSONValue(stringLiteral: "Value2"))])
//        let var2 = CustomVariables(customVariables: [CustomVariablesModel(variable: "Variable1", value: JSONValue(stringLiteral: "Value3"))])
//        
//        let output1 = personalization.isContextSwitched(ctx: .CustomVariables, event: var1)
//        personalization.report(context: .CustomVariables, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .CustomVariables, event: var2)
//        
//        XCTAssertEqual(output1, false, "CustomVariables context is not switched")
//        XCTAssertEqual(output2, true, "CustomVariables context is switched")
//    }
    
//    func testReportMetadataEvent () {
//        let var1 = Metadata(metadata: JSONValue.init(dictionaryLiteral: ("fname", "umar"), ("lname", "sayyed")))
//        let var2 = Metadata(metadata: JSONValue.init(dictionaryLiteral: ("fname", "val")))
//        
//        let output1 = personalization.isContextSwitched(ctx: .Metadata, event: var1)
//        personalization.report(context: .Metadata, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .Metadata, event: var2)
//        
//        XCTAssertEqual(output1, false, "Metadata context is not switched")
//        XCTAssertEqual(output2, true, "Metadata context is switched")
//    }
    
//    func testReportUserAgentEvent () {
//        let var1 = UserAgent(userAgent: "Mozilla")
//        let var2 = UserAgent(userAgent: "Safari")
//        
//        let output1 = personalization.isContextSwitched(ctx: .UserAgent, event: var1)
//        personalization.report(context: .UserAgent, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .UserAgent, event: var2)
//        
//        XCTAssertEqual(output1, false, "UserAgent context is not switched")
//        XCTAssertEqual(output2, true, "UserAgent context is switched")
//    }
    
//    func testReportIpadressEvent () {
//        let var1 = IPAddress(ipAddress: "192.168.0.1")
//        let var2 = IPAddress(ipAddress: "192.168.0.2")
//        
//        let output1 = personalization.isContextSwitched(ctx: .IpAddress, event: var1)
//        personalization.report(context: .IpAddress, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .IpAddress, event: var2)
//        
//        XCTAssertEqual(output1, false, "IpAddress context is not switched")
//        XCTAssertEqual(output2, true, "IpAddress context is switched")
//    }
    
//    func testReportScreensizeEvent () {
//        
//        let var1 = ScreenSize(height: 1800, width: 1024)
//        let var2 = ScreenSize(height: 2500, width: 1400)
//        
//        let output1 = personalization.isContextSwitched(ctx: .ScreenSize, event: var1)
//        personalization.report(context: .ScreenSize, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .ScreenSize, event: var2)
//        
//        XCTAssertEqual(output1, false, "ScreenSize context is not switched")
//        XCTAssertEqual(output2, true, "ScreenSize context is switched")
//    }
    
//    func testReportCoordinatesEvent () {
//        
//        let var1 = Coordinates(latitude: "92.687689", longitude: "12.78328913")
//        let var2 = Coordinates(latitude: "92.687689", longitude: "13.78328913")
//        
//        let output1 = personalization.isContextSwitched(ctx: .Coordinates, event: var1)
//        personalization.report(context: .Coordinates, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .Coordinates, event: var2)
//        
//        XCTAssertEqual(output1, false, "Coordinates context is not switched")
//        XCTAssertEqual(output2, true, "Coordinates context is switched")
//    }
    
//    func testReportCartEvent () {
//        let var1 = Cart(cartLines: [CartLine(sku: "sku-111", pid: "pid-111", quantity: 1, currency: "USD", value: "111")])
//        let var2 = Cart(cartLines: [CartLine(sku: "sku-222", pid: "pid-222", quantity: 2, currency: "USD", value: "222")])
//        
//        let output1 = personalization.isContextSwitched(ctx: .Cart, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .Cart, event: var2)
//        
//        XCTAssertEqual(output1, false, "Cart context is not switched")
//        XCTAssertEqual(output2, false, "Cart context is switched")
//    }
    
//    func testReportPurchaseEvent () {
//        let var1 = Purchase(account: "Flipkart", domain: "www.flipkart.com", instance: "instance-111", purchaseId: "PID-111", purchaseLines: [PurchaseLine(sku: "sku-111", pid: "pid-111", quantity: 2, currency: "USD", value: "111")])
//        
//        let var2 = Purchase(account: "Flipkart", domain: "www.flipkart.com", instance: "instance-222", purchaseId: "PID-222", purchaseLines: [PurchaseLine(sku: "sku-222", pid: "pid-222", quantity: 2, currency: "USD", value: "222")])
//        
//        let output1 = personalization.isContextSwitched(ctx: .Purchase, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .Purchase, event: var2)
//        
//        XCTAssertEqual(output1, false, "Purchase context is not switched")
//        XCTAssertEqual(output2, false, "Purchase context is not switched")
//    }
    
//    func testReportProductDetailsViewEvent () {
//        let var1 = ProductDetailView(products: [Product(productId: "prod-111", sku: "sku-111")])
//        let var2 = ProductDetailView(products: [Product(productId: "prod-222", sku: "sku-222")])
//        
//        let output1 = personalization.isContextSwitched(ctx: .ProductDetailView, event: var1)
//        let output2 = personalization.isContextSwitched(ctx: .ProductDetailView, event: var2)
//        
//        XCTAssertEqual(output1, false, "ProductDetailView context is not switched")
//        XCTAssertEqual(output2, false, "ProductDetailView context is not switched")
//    }
    
//    func testRecClicks() {
//        personalization.report(context: .RecClicks, event: RecClicks(recClicks: ["rt.1.xxx"]))
//    }
    
//    func testRecImpressions() {
//        personalization.report(context: .RecImpressions, event: RecImpressions(recImpressions: ["rt.1.yyy"]))
//    }
    
//    func testImpressions() {
//        personalization.report(context: .Impressions, event: Impressions(impressionIds: ["rt.1.yyy"]))
//    }
}
