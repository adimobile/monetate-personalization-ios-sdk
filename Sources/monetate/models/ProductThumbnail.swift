//
//  ProductThumbnail.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class ProductThumbnailView: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType:String
    /** The list of products viewed on a product detail page. */
    public var products: Set<String>
    
    public init(products: Set<String>) {
        eventType = "monetate:context:ProductThumbnailView"
        self.products = products
       // try! checkProducs()
    }
    
    func checkProducs () throws {
        if (!products.isEmpty) {
            for strProductId in products {
                if (strProductId == "") {throw ProductThumbnailViewError.products(description: "Array contains Invalid Product Id")}
            }
        }
    }
}

enum ProductThumbnailViewError : Error {
    case products(description: String)
}
