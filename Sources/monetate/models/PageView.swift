//
//  File.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 01/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

public struct PageView: Codable,Context {
    
    public func isContextSwitched(ctx: Context) -> Bool {
        if let val = ctx as? PageView {
            if val.pageType != self.pageType {return true}
            if val.url != nil && val.url != self.url {return true}
            if  val.categories != nil && val.categories != self.categories {return true}
            if  val.breadcrumbs != nil && val.breadcrumbs != self.breadcrumbs {return true}
        }
        return false
    }
    
    /** A value which identifies the type of event. */
    public var eventType: String = "monetate:context:PageView"
    /** The type of page viewed, e.g. \&quot;index\&quot; or \&quot;home\&quot; or \&quot;pdp\&quot; */
    public var pageType: String
    /** The path portion of the URL for the page viewed. Must be included if \&quot;url\&quot; property is not included.  */
    public var path: String?
    /** The complete URL for the page viewed. Must be included if \&quot;path\&quot; property is not included.  */
    public var url: String?
    /** Categories to filter against. Only matching actions will be evaluated.  */
    public var categories: [String]?
    /** Breadcrumbs to filter against. Only matching actions will be evaluated.  */
    public var breadcrumbs: [String]?
    
    public init?(pageType: String?, path: String?, url: String?, categories: [String]?, breadcrumbs: [String]?) {
        guard let pageType = pageType else {
            return nil
        }
        self.pageType = pageType
        self.path = path
        self.url = url
        self.categories = categories
        self.breadcrumbs = breadcrumbs
        //try! checkPageType()
    }
    
    func checkPageType () throws {
        if (pageType == "") {throw PageTypeError.pageType(description: "Invalid pageType")}
    }
}

enum PageTypeError : Error {
    case pageType(description: String)
}
