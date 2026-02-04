//
//  Referrer.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 26/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** This is the referring URL of the visitor.  */

public struct Referrer: Codable, Context {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? Referrer, val.referrer != self.referrer {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** The referring URL */
    public var referrer: String
    
    public init?(referrer: String) {
        guard Referrer.isValid(referrer: referrer) else {
            return nil
        }
        eventType = "monetate:context:Referrer"
        self.referrer = referrer
       // try! checkReferrer()
    }
    
    func checkReferrer () throws {
        if (referrer == "") {throw ReferrerError.referrer(description: "Invalid referrer")}
    }
    
    // Static validation function
    private static func isValid(referrer: String) -> Bool {
        if referrer.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        return true
    }
}

enum ReferrerError : Error {
    case referrer(description: String)
}

