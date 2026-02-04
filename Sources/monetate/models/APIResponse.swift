//
//  APIResponse.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 12/11/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public class APIResponse {
    public var requestId:String?
    public let status: Int?
    public let res: URLResponse?
    public let data: Any?
    public let error: Error?
    public let isSuccess:Bool
    
    init (success: Bool, res: URLResponse?, status: Int?, data: Data?, error: Error? = nil, requestId:String?) {
        self.isSuccess = success
        self.res = res
        self.data = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions())
        self.status = status
        self.error = error
        self.requestId = requestId
    }
}
