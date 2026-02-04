//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 30/09/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** This visitor&#39;s screen size, height and width in pixels.  */
public class ScreenSize : Context,Codable {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? ScreenSize, (val.width != self.width || val.height != self.height) {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** screen height in pixels */
    public var height: Int
    /** screen width in pixels */
    public var width: Int
    
    public init?(height: Int?, width: Int?) {
        guard let height = height, let width = width else {
            return nil
        }
        eventType = "monetate:context:ScreenSize"
        self.height = height
        self.width = width
        //try! checkScreenSize()
    }
    
    func checkScreenSize () throws {
        if (height <= 0 || width <= 0) {throw ScreenSizeError.screenSize(description: "Invalid screen size")}
    }
}

enum ScreenSizeError : Error {
    case screenSize(description: String)
}
