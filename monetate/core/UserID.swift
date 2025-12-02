//
//  UserID.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 05/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class User :Codable {
    public var monetateId: String?
    public var deviceId: String?
    public var customerId: String?
    /**
     Value should be passed in every call

     If deviceId has a value it should be the default id sent in all API calls

     MonetateId should be set by the client. If deviceId is not defined then monetateId should be used as the default id.

     Either monetateId or deviceId is required in API calls. Both ids should not be passed together.

     If customerId is defined it should also be passed in all calls along with one of the other ids. This should not be changed after init except for when setCustomerId() is called
     */
    public init(monetateId:String?=nil, deviceId: String? = nil, customerId: String? = nil) {
        self.monetateId = monetateId
        if let val = monetateId{
            self.monetateId = val
        }
        self.deviceId = deviceId
        if let val = deviceId {
            self.deviceId = val
        }
        self.customerId = customerId
        
        try! checkMonetateIDAndDeviceID()
    }
    
    func checkMonetateIDAndDeviceID () throws {
        if ((monetateId != nil) && monetateId == "") {throw UserIdError.monetateID(description: "Invalid monetateId")}
        if ((deviceId != nil) && deviceId == "") {throw UserIdError.deviceID(description: "Invalid deviceId")}
        if (monetateId == nil && deviceId == nil) {throw UserIdError.UserID(description: "monetateId or deviceId, anyone is required")}
    }
    
    public func setCustomerId (customerId: String?) {
        self.customerId = customerId
    }
}

enum UserIdError : Error {
    case UserID(description: String)
    case monetateID(description: String)
    case deviceID(description: String)
}
