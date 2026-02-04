//
//  GetActionTests.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 25/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class GetActionTests: XCTestCase {
    let requestid = "123456"
    final var personalization = Personalization(
        account: Account(instance: "p", domain: "localhost.org", name: "a-701b337c", shortname: "localhost"),
        user: User(monetateId: "2.1349157357.1736226061396", deviceId: "62bd2e2d-213d-463f-83bb-12c0b2530a14", customerId: "iehiurhgir")
    )
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testGenerateMonetateId () {
        print("testGenerateMonetateId-\(personalization.generateMonetateID())")
    }
    
//    func testGetActionsProductDetailsView () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .ProductDetailView, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: ProductDetailView(products: [Product(productId: "PROD-278", sku: "DENIM Jeans")])).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 20)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsPageEvent () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .PageEvents, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: PageEvents(pageEvents: ["Page 1", "Page 2", "Page 3"])).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsPageView () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .PageView, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: PageView(pageType: "profile", path: "/profile", url: "http:/home", categories: nil, breadcrumbs: nil)).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsPurchase () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .Purchase, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: Purchase(account: "Flipkart", domain: "www.flipkart.com", instance: "instance-111", purchaseId: "PID-111", purchaseLines: [PurchaseLine(sku: "sku-111", pid: "pid-111", quantity: 2, currency: "USD", value: "111")])).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsCart () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .Cart, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: Cart(cartLines: [CartLine(sku: "sku-111", pid: "pid-111", quantity: 1, currency: "USD", value: "111")])).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsUserAgent () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .UserAgent, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: UserAgent(userAgent: "Mozilla")).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsIPAddress () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .IpAddress, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: IPAddress(ipAddress: "192.168.0.2")).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
    
//    func testGetActionsCoordinates () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .Coordinates, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: Coordinates(latitude: "92.687689", longitude: "12.78328913")).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
    
//    func testGetActionsScreenSize () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .ScreenSize, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: ScreenSize(height: 1800, width: 1024)).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsMetadata () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .Metadata, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: Metadata(metadata: JSONValue.init(dictionaryLiteral: ("fname", "umar"), ("lname", "sayyed")))).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsCustomVariables () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .CustomVariables, requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"], event: CustomVariables(customVariables: [CustomVariablesModel(variable: "Variable1", value: JSONValue(stringLiteral: "Value3"))])).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsMultiContext () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.addEvent(context: .ScreenSize, event: ScreenSize(height: 1800, width: 1024))
//        personalization.addEvent(context: .PageView, event: PageView(pageType: "PDP", path: "n/a", url: "n/a", categories: [], breadcrumbs: []))
//        
//        personalization.getActionsData(requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson"]).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsWithActionFilters () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.addEvent(context: .ScreenSize, event: ScreenSize(height: 1800, width: 1024))
//        personalization.addEvent(context: .PageView, event: PageView(pageType: "PDP", path: "n/a", url: "n/a", categories: [], breadcrumbs: []))
//        
//        personalization.getActionsData(requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelJson", "monetate:action:OmnichannelRecommendation"]).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsRecommendation () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.addEvent(context: .PageView, event: PageView(pageType: "PDP", path: "n/a", url: "n/a", categories: [], breadcrumbs: []))
//        personalization.addEvent(context: .IpAddress, event: IPAddress(ipAddress: "192.168.0.2"))
//        
//        personalization.getActionsData(requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:OmnichannelRecommendation"]).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsSocialProof () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.addEvent(context: .PageView, event: PageView(pageType: "PDP", path: "n/a", url: "n/a", categories: [], breadcrumbs: []))
//        personalization.addEvent(context: .IpAddress, event: IPAddress(ipAddress: "192.168.0.1"))
//        
//        personalization.getActionsData(requestId: requestid, includeReporting: true, arrActionTypes: ["monetate:action:SocialProofDataV2"]).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
    
//    func testGetActionsBadging () {
//        let exp = XCTestExpectation(description: "Testing testGetActions api ")
//        var code = 400;
//        personalization.getActions(context: .ProductThumbnailView, requestId: "test_request_id", includeReporting: true, arrActionTypes: ["monetate:action:OmniChannelImageBadging"], event: ProductThumbnailView(products: Set(["BackP_010"]))).on(success: { (res) in
//            
//            print("response", res.status!, res.data!)
//            if let key = res.status {
//                code = key
//            }
//            exp.fulfill()
//        })
//        wait(for: [exp], timeout: 6)
//        XCTAssertEqual(code, 200, "testGetActions not working as expected")
//    }
}
