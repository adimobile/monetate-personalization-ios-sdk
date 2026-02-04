//
//  Utility.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 12/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


class Utility {
    
    static func processEvent (context:ContextEnum, data: MEvent, mqueue: [ContextEnum: MEvent]) -> Future<[ContextEnum: MEvent], Error> {
        var queue = mqueue
        let promise = Promise<[ContextEnum: MEvent], Error>()
        switch context {
        case .RecClicks:
            queue[.RecClicks] = data
            promise.succeed(value: queue)
            break
        case .RecImpressions:
            queue[.RecImpressions] = data
            promise.succeed(value: queue)
            break
        case .Impressions:
            queue[.Impressions] = data
            promise.succeed(value: queue)
            break
        case .PageEvents:
            queue[.PageEvents] = data
            promise.succeed(value: queue)
            break
        case .ProductDetailView:
            if let event = queue[.ProductDetailView] as? ProductDetailView, let prod1 = event.products ,let data = data as? ProductDetailView, let prod2 = data.products  {
                event.products = ProductDetailView.merge(first: prod1, second: prod2)
            } else {
                queue[.ProductDetailView] = data
            }
            promise.succeed(value: queue)
            break
        case .ProductThumbnailView:
            if let event = queue[.ProductThumbnailView] as? ProductThumbnailView, let data = data as? ProductThumbnailView {
                event.products = event.products.union(data.products)
            } else {
                queue[.ProductThumbnailView] = data
            }
            promise.succeed(value: queue)
            break
        case .Cart:
            if let key = queue[.Cart] as? Cart, let lines1 = key.cartLines, let data = data as? Cart, let lines2 = data.cartLines {
                key.cartLines = Cart.merge(first: lines1, second: lines2)
            } else {
                queue[.Cart] = data
            }
            promise.succeed(value: queue)
            break
        case .AddToCart:
            if let key = queue[.AddToCart] as? AddToCart, let lines1 = key.cartLines, let data = data as? AddToCart, let lines2 = data.cartLines {
                key.cartLines = AddToCart.merge(first: lines1, second: lines2)
            } else {
                queue[.AddToCart] = data
            }
            promise.succeed(value: queue)
            break
        case .Purchase:
            if let event = queue[.Purchase] as? Purchase, let lines1 = event.purchaseLines, let data = data as? Purchase, let lines2 = data.purchaseLines  {
                event.purchaseLines = Purchase.merge(first: lines1, second: lines2)
            } else {
                queue[.Purchase] = data
            }
            promise.succeed(value: queue)
            break
        case .Metadata:
            if let event = queue[.Metadata] as? Metadata, let data = data as? Metadata {
                event.metadata = Metadata.merge(first: event.metadata, second: data.metadata)
            } else {
                queue[.Metadata] = data
            }
            promise.succeed(value: queue)
            break
        case .CustomVariables:
            if let event = queue[.CustomVariables] as? CustomVariables, let data = data as? CustomVariables {
                event.customVariables = CustomVariables.merge(first: event.customVariables, second: data.customVariables)
            } else {
                queue[.CustomVariables] = data
            }
            promise.succeed(value: queue)
            break
            
        default:
            queue[context] = data
            promise.succeed(value: queue)
        }
        return promise.future
    }
    
    static func createEventBody(queue: [ContextEnum: MEvent]) -> [[String: Any]] {
        var json: [[String: Any]] = []
        
        for (key, val) in queue {
            var data: Data?
            
            switch key {
            case .CustomVariables:
                data = try? JSONEncoder().encode(val as? CustomVariables)
            case .PageView:
                data = try? JSONEncoder().encode(val as? PageView)
            case .Language:
                data = try? JSONEncoder().encode(val as? Language)
            case .RecClicks:
                data = try? JSONEncoder().encode(val as? RecClicks)
            case .RecImpressions:
                data = try? JSONEncoder().encode(val as? RecImpressions)
            case .Impressions:
                data = try? JSONEncoder().encode(val as? Impressions)
            case .PageEvents:
                data = try? JSONEncoder().encode(val as? PageEvents)
            case .Referrer:
                data = try? JSONEncoder().encode(val as? Referrer)
            case .UserAgent:
                data = try? JSONEncoder().encode(val as? UserAgent)
            case .Coordinates:
                data = try? JSONEncoder().encode(val as? Coordinates)
            case .ScreenSize:
                data = try? JSONEncoder().encode(val as? ScreenSize)
            case .IpAddress:
                data = try? JSONEncoder().encode(val as? IPAddress)
            case .Cart:
                data = try? JSONEncoder().encode(val as? Cart)
            case .AddToCart:
                data = try? JSONEncoder().encode(val as? AddToCart)
            case .ProductDetailView:
                data = try? JSONEncoder().encode(val as? ProductDetailView)
            case .ProductThumbnailView:
                data = try? JSONEncoder().encode(val as? ProductThumbnailView)
            case .Purchase:
                data = try? JSONEncoder().encode(val as? Purchase)
            case .DecisionRequest:
                data = try? JSONEncoder().encode(val as? DecisionRequest)
            case .Metadata:
                data = try? JSONEncoder().encode(val as? Metadata)
//                if let metadataObj = val as? Metadata {
//                    data = metadataObj.encodeForLanguage()
//                }
            }
            
            if let validData = data, let dict = validData.toJSON() {
                json.append(dict)
            } else {
                Log.error("Failed to encode or convert \(key) to JSON dictionary")
            }
        }
        
        return json
    }

}
