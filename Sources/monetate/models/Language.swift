//
//  Language.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 26/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/** The visitor&#39;s language preference, if known.  Used for experience targeting.  */

public struct Language: Codable, Context {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? Language, val.language != self.language {
            return true
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public let eventType:String
    /** A language tag, in the format used in the Accept-Language HTTP header. */
    public var language: String
    
    public init(language: String) {
        eventType = "monetate:context:Language"
        self.language = language
       // try! checkLanguage()
    }
    
    func checkLanguage () throws {
        if (language == "") {throw LanguageError.language(description: "Invalid language")}
    }
}

enum LanguageError : Error {
    case language(description: String)
}
