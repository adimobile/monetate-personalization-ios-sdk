//
//  Action.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 11/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

class Action: Codable {
    
    var actionId: String!
    var actionType: String!
    var component: String!
    var impressionId: String!
    var impressionReporting: String!
    var type: String!
    
    init(json: [String: Any]) {
        if let val = json["actionId"] as? String {
            actionId = val
        }
        if let val = json["actionType"] as? String {
            actionType = val
        }
        if let val = json["component"] as? String {
            component = val
        }
        if let val = json["impressionId"] as? String {
            impressionId = val
        }
        if let dic = json["json"] as? [String: String], let type = dic["type"] {
            self.type = type
        }
    }
}
