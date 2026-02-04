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
        self.deviceId = deviceId
        self.customerId = customerId
        
        do {
            try checkMonetateIDAndDeviceID()
        } catch {
            Log.error(error.localizedDescription)
        }
    }
    
    func checkMonetateIDAndDeviceID() throws {
        // If monetateId is non-nil but empty
        if let monetateId = monetateId, monetateId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw UserIdError.monetateID(description: "Invalid monetateId")
        }
        
        // If deviceId is non-nil but empty
        if let deviceId = deviceId, deviceId.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            throw UserIdError.deviceID(description: "Invalid deviceId")
        }
        
        // If both are nil
        if monetateId == nil && deviceId == nil {
            throw UserIdError.userID(description: "Either monetateId or deviceId is required")
        }
    }
    
    public func setCustomerId (customerId: String?) {
        self.customerId = customerId
    }
}

enum UserIdError : LocalizedError {
    case userID(description: String)
    case monetateID(description: String)
    case deviceID(description: String)
    case invalidCustomerId
    
    var errorDescription: String? {
        switch self {
        case .userID(let desc), .monetateID(let desc), .deviceID(let desc):
            return desc
        case .invalidCustomerId:
            return "Invalid customer id"
        }
    }
}
