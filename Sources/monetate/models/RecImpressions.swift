//
//  RecImpressions.swift
//  monetate-ios-sdk
//
//  Created by Rajan Marathe on 04/07/22.
//  Copyright © 2022 Monetate. All rights reserved.
//

import Foundation

/** Used to record rec impressions. An impression is recorded for each token sent. */

public struct RecImpressions: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType: String
    
    /** An Array of rec tokens to be recorded.*/
    public var recImpressions: [String]
    
    public init?(recImpressions: [String]) {
        guard RecImpressions.isValid(recImpressionIds: recImpressions) else {
            return nil
        }
        eventType = "monetate:record:RecImpressions"
        self.recImpressions = recImpressions
        // try! checkRecImpressions()
    }
    
    func checkRecImpressions () throws {
        if (!recImpressions.isEmpty) {
            for strRecImpression in recImpressions {
                if (strRecImpression == "") {throw RecImpressionsError.recImpressions(description: "Array contains Invalid RecImpression")}
            }
        }
    }
    
    // Static validation function
       private static func isValid(recImpressionIds: [String]) -> Bool {
           // Check that array is not empty and no string is empty
           guard !recImpressionIds.isEmpty else { return false }
           for id in recImpressionIds {
               if id.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                   return false
               }
           }
           return true
       }
}

enum RecImpressionsError : Error {
    case recImpressions(description: String)
}
