//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation


/** This is the IP address of the visitor.  */

public struct IPAddress: Context,Codable {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? IPAddress, val.ipAddress != self.ipAddress {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** The IP address */
    public var ipAddress: String
    
    public init?(ipAddress: String?) {
        guard let ipAddress = ipAddress else {
            return nil
        }
        eventType = "monetate:context:IpAddress"
        self.ipAddress = ipAddress
       // try! checkIPAddress()
    }
    
    func checkIPAddress () throws {
        if (ipAddress == "") {throw IPAddressError.ipAddress(description: "Invalid ipAddress")}
    }
}

enum IPAddressError : Error {
    case ipAddress(description: String)
}
