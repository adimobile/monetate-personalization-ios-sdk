//
//  ProductDetail.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class ProductDetailView: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** The list of products and product specific details being viewed. */
    public var products: [Product]?
    
    public init?(products: [Product]?) {
        guard let products = products else {
            return nil
        }
        eventType = "monetate:context:ProductDetailView"
        self.products = products
    }
    
    static func merge (first: [Product], second: [Product]) -> [Product] {
        let merged = Array(Dictionary([first, second].joined().map { ($0.productId, $0)}, uniquingKeysWith: { $1 }).values)
        return merged
    }
}


public struct Product: Codable {
    
    public var productId: String
    public var sku: String
    
    public init(productId: String, sku: String) {
        self.productId = productId
        self.sku = sku
       // try! checkProduct()
    }
    
    func checkProduct () throws {
        if (productId == "") {throw ProductError.productId(description: "Invalid productId")}
        if (sku == "") {throw ProductError.sku(description: "Invalid sku")}
    }
}

enum ProductError : Error {
    case productId(description: String)
    case sku(description: String)
}

