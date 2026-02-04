//
//  Impressions.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 12/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** Used to record impressions.  Each impressionId is a token that is associated with an action from an earlier request. */

public struct Impressions: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType: String 
    /** A list of impression identifier strings. */
    public var impressionIds: [String]
    
    public init?(impressionIds: [String]) {
        guard Impressions.isValid(impressionIds: impressionIds) else {
            return nil
        }
        eventType = "monetate:record:Impressions"
        self.impressionIds = impressionIds
        // try! checkImpressions()
    }
    
    func checkImpressions () throws {
        if (!impressionIds.isEmpty) {
            for strImpressionId in impressionIds {
                if (strImpressionId == "") {throw ImpressionsError.impressions(description: "Array contains Invalid impression id")}
            }
        }
    }
    
    // Static validation function
       private static func isValid(impressionIds: [String]) -> Bool {
           // Check that array is not empty and no string is empty
           guard !impressionIds.isEmpty else { return false }
           for id in impressionIds {
               if id.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                   return false
               }
           }
           return true
       }

}

enum ImpressionsError : Error {
    case impressions(description: String)
}
