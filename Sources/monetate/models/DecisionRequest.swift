//
//  DecisionRequest.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 30/12/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class DecisionRequest: MEvent, Codable {
    let requestId:String
    var includeReporting : Bool
    public let eventType: String
    var actionTypes:[String]?
    
    init (requestId:String, includeReporting:Bool, actionTypes:[String]) {
        self.requestId = requestId
        self.includeReporting = includeReporting
        self.eventType = "monetate:decision:DecisionRequest"
        self.actionTypes = actionTypes
    }
}
