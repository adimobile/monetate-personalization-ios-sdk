//
//  PageEvent.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 12/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** Used to record when one or more page events have occurred. Each string in the array should be a key that was defined in the Monetate user interface when the page event was created.  */

public class PageEvents: Codable, MEvent {
    
    /** A value which identifies the type of event. */
    public let eventType: String
    /** An array of Page Events. */
    public var pageEvents: Set<String>
    
    public init(pageEvents: Set<String>) {
        eventType = "monetate:record:PageEvents"
        self.pageEvents = pageEvents
        //try! checkPageEvents()
    }
    
    func checkPageEvents () throws {
        if (!pageEvents.isEmpty) {
            for strPageEvent in pageEvents {
                if (strPageEvent == "") {throw PageEventsError.pageEvent(description: "Array contains Invalid pageEvent")}
            }
        }
    }
}

enum PageEventsError : Error {
    case pageEvent(description: String)
}

