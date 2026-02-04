//
//  EventTypeEnum.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 08/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


public enum ContextEnum: String, MEvent {
    case UserAgent = "monetate:context:UserAgent"
    case IpAddress = "monetate:context:IpAddress"
    case Referrer = "monetate:context:Referrer"
    case Coordinates = "monetate:context:Coordinates"
    case ScreenSize = "monetate:context:ScreenSize"
    case Language = "monetate:context:Language"
    case Impressions = "monetate:record:Impressions"
    case PageEvents = "monetate:record:PageEvents"
    case PageView = "monetate:context:PageView"
    case Cart = "monetate:context:Cart"
    case AddToCart = "monetate:context:AddToCart"
    case Purchase = "monetate:context:Purchase"
    case ProductDetailView = "monetate:context:ProductDetailView"
    case ProductThumbnailView = "monetate:context:ProductThumbnailView"
    case Metadata = "monetate:context:Metadata"
    case CustomVariables = "monetate:context:CustomVariables"
    case DecisionRequest = "monetate:decision:DecisionRequest"
    case RecClicks = "monetate:record:RecClicks"
    case RecImpressions = "monetate:record:RecImpressions"
}

enum ActionTypeEnum: String {
    case searchAction = "monetate:action:SiteSearchApiAction"
}

enum RequestIdEnum: String, Codable{
    case productSearch
    case suggestionQuery
    case suggestionWithproducts
    case categoryNavigation
    case contentSearch
    case reportTokenClick
    case urlRedirect
    case filterFetch
}
