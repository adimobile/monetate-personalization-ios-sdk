//
//  SearchData.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 30/06/25.
//  Copyright © 2025 Monetate. All rights reserved.
//

import Foundation

/// Search prerequisite data
struct SearchPreRequisite: Equatable {
    var channelData: String
    var searchToken: String?
    var actionId: String?
    
    public init(channelData: String, searchToken: String? = nil, actionId: String? = nil) {
        self.channelData = channelData
        self.searchToken = searchToken
        self.actionId = actionId
    }
}

/// Site Search configuration parameters
struct SiteSearchConfigParams {
    var searchTerm: String?
    var limit: Int?
    var requestId: RequestIdEnum?
    var categoryPath: String?
    var offset: Int?
    var typeOfRecords: [String]?
    var filterFacets: JSONValue?

    
    // Custom convenience initializers
    /// Search
    init(forSearch searchTerm: String?, limit: Int?, offset: Int?){
        self.searchTerm = searchTerm
        self.limit = limit
        self.offset = offset
        self.requestId = .productSearch
    }
    
    /// Autosuggest
    init(forAutosuggest searchTerm: String?, limit:Int?, offset:Int?, returnProducts: Bool?) {
        self.searchTerm = searchTerm
        self.limit = limit
        self.offset = offset
        self.requestId = returnProducts ?? false ? .suggestionWithproducts : .suggestionQuery
    }
    
    /// Category Navigation
    init(forCategoryNavigation categoryPath: String?, limit: Int?, offset: Int?) {
        self.categoryPath = categoryPath
        self.limit = limit
        self.offset = offset
        self.requestId = .categoryNavigation
    }
    
    /// Content Search
    init(forContentSearch searchTerm: String?, typeOfRecords: [String]?, limit:Int?, offset:Int?) {
        self.searchTerm = searchTerm
        self.typeOfRecords = typeOfRecords
        self.limit = limit
        self.offset = offset
        self.requestId = .contentSearch
    }
    
    /// Filter Fetch
    init(forFilterFetch searchTerm: String?, limit: Int?, filterFacets: JSONValue?) {
        self.searchTerm = searchTerm
        self.limit = limit
        self.filterFacets = filterFacets
        self.requestId = .filterFetch
    }
}


/// Search API request model
struct SearchRequest: Codable {
    let recordQueries: [RecordQuery]?
    let suggestions: [Suggestion]?
    let searchToken: String?
    
    private enum CodingKeys: String, CodingKey {
        case recordQueries
        case suggestions
        case searchToken
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        // Default encoding for recordQueries and suggestions
        try container.encodeIfPresent(recordQueries, forKey: .recordQueries)
        try container.encodeIfPresent(suggestions, forKey: .suggestions)
        
        // Explicitly encode searchToken even if nil
        if let token = searchToken {
            try container.encode(token, forKey: .searchToken)
        } else {
            try container.encodeNil(forKey: .searchToken)
        }
    }
    
    struct RecordQuery: Codable {
        let id: RequestIdEnum?
        let typeOfRequest: TypeOfRequest?
        let settings: RecordSettings?
        var filterFacets: JSONValue?
        
        private enum CodingKeys: String, CodingKey {
            case id
            case typeOfRequest
            case settings
            case filterFacets = "filters"
        }
        
        // Default initialiser
        init(
            id: RequestIdEnum?,
            typeOfRequest: TypeOfRequest?,
            settings: RecordSettings?
        ) {
            self.id = id
            self.typeOfRequest = typeOfRequest
            self.settings = settings
        }
        
        // Custom convenience initializers
        /// Filter Fetch
        init(forFileterFetch
                id: RequestIdEnum?,
                typeOfRequest: TypeOfRequest?,
                settings: RecordSettings?,
                filterFacets: JSONValue?
            ) {
                self.id = id
                self.typeOfRequest = typeOfRequest
                self.settings = settings
                self.filterFacets = filterFacets
            }
    }
    
    struct RecordSettings: Codable {
        var query: QueryTerm?
        var limit: Int?
        var offset: Int?
        var typeOfRecords: [String]?
        
        // Custom convenience initializers
        /// General settings
        init(query: QueryTerm?, limit: Int?, offset: Int?) {
            self.query = query
            self.limit = limit
            self.offset = offset
        }
        
        /// Content Search
        init(forContentSearch query: QueryTerm?,typeOfRecords: [String]?, limit: Int?, offset: Int?) {
            self.query = query
            self.typeOfRecords = typeOfRecords
            self.limit = limit
            self.offset = offset
        }
        
        /// Filter Fetch
        init(forFilterFetch query: QueryTerm?, limit: Int?) {
            self.query = query
            self.limit = limit
        }
    }
    
    struct QueryTerm: Codable {
        var term: String?
        var categoryPath: String?
        
        // Custom convenience initializers
        /// Search
        init(forSearch term: String?) {
            self.term = term
        }
        
        ///  Category Navigation
        init(forCategoryNav categoryPath: String?) {
            self.categoryPath = categoryPath
        }
    }
    
    struct Suggestion: Codable {
        let suggestionID: RequestIdEnum?
        let typeOfQuery: TypeOfRequest?
        let query: String?

        enum CodingKeys: String, CodingKey {
            case suggestionID = "id"
            case typeOfQuery
            case query
        }
    }
}

/// Report search token click
struct TokenClickRequest: Codable {
    let searchClickToken: String
}

/// Search error handler
enum SearchError: LocalizedError {
    case invalidInput
    case noActionsFound
    case noSearchActionFound(domain: String)
    case missingSearchToken
    case missingActionId
    case configurationFailed
    case fetchFailed
    case invalidClickToken

    var errorDescription: String? {
        switch self {
        case .invalidInput:
            return "Search input was empty or invalid. Please provide a valid search query."
        case .noActionsFound:
            return "Execution Alert: No actions found in response data during search."
        case .noSearchActionFound(let domain):
            return "Execution Alert: No active search actions of type \"\(ActionTypeEnum.searchAction.rawValue)\" found for domain \"\(domain)\"."
        case .missingSearchToken:
            return "Execution Alert: Missing required searchToken parameter in action."
        case .missingActionId:
            return "Execution Alert: Missing required actionId parameter."
        case .configurationFailed:
            return "Configuration or network issue encountered. Ensure SDK is properly configured."
        case .fetchFailed:
            return "Failed to fetch search results: input invalid or no data returned."
        case .invalidClickToken:
            return "Input token was empty or invalid, Please provide a valid token"
        }
    }
}
