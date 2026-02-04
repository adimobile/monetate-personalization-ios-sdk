//
//  ProductDetailViewTest.swift
//  monetate-ios-sdkTests
//
//  Created by Umar Sayyed on 03/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import XCTest
@testable import Monetate

class ProductDetailViewTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMergeCase1 () {
        let val1 = ProductDetailView(products: [Product(productId: "PROD-111", sku: "PRODUCT-111"),
                                                Product(productId: "PROD-333", sku: "PRODUCT-333")])
        let val2 = ProductDetailView(products: [Product(productId: "PROD-222", sku: "PRODUCT-222"),
                                                Product(productId: "PROD-444", sku: "PRODUCT-444")])
        let arr = ProductDetailView.merge(first: val1.products!, second: val2.products!)
        XCTAssertEqual(arr.count, 4, "Merging is failed, count should be 4")
    }
    
    func testMergeCase2 () {
        let val1 = ProductDetailView(products: [Product(productId: "PROD-111", sku: "PRODUCT-111"),
                                                Product(productId: "PROD-333", sku: "PRODUCT-333")])
        let val2 = ProductDetailView(products: [Product(productId: "PROD-222", sku: "PRODUCT-222"),
                                                Product(productId: "PROD-111", sku: "PRODUCT-444")])
        let arr = ProductDetailView.merge(first: val1.products!, second: val2.products!)
        XCTAssertEqual(arr.count, 3, "Merging is failed, count should be 3")
    }
    
}
