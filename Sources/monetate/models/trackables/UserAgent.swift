
//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** This is the user-agent header from the client originating the request.  */
public struct UserAgent: Context, Codable {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? UserAgent, val.userAgent != self.userAgent {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType: String 
    /** The user-agent header value */
    public var userAgent: String
    
    public init?(userAgent: String?) {
        guard let userAgent = userAgent else {
                return nil
            }
        eventType = "monetate:context:UserAgent"
        self.userAgent = userAgent
       // try! checkUserAgent()
    }
    
    func checkUserAgent () throws {
        if (userAgent == "") {throw AccountError.instance(description: "Invalid user agent")}
    }
}

enum UserAgentError : Error {
    case userAgent(description: String)
}
