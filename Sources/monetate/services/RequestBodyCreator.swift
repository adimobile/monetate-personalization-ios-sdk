//
//  RequestBodyCreator.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 12/11/25.
//

/// A utility class responsible for building various types of `SearchRequest` bodies.
final class RequestBodyCreator {
    
    // MARK: - Public General Entry Function
    
    /// Creates a `SearchRequest` based on the specified request id.
    /// The type of requests  to create are`search`,`autoSuggest`, `suggestionWithproducts`, `categoryNavigation`, `contentSearch`
    /// - Parameters:
    ///   - searchConfig: The configuration parameters for the request.
    ///   - searchToken: Optional token from the Monetate engine API.
    /// - Returns: A configured `SearchRequest` instance.
    ///
    func createRequestBody(
        searchConfig: SiteSearchConfigParams,
        searchToken: String?
    ) -> SearchRequest? {
        switch searchConfig.requestId {
        case .productSearch:
            return createSearchBody(searchConfig: searchConfig, searchToken: searchToken)
            
        case .suggestionQuery:
            return createAutoSuggestBody(searchConfig: searchConfig, searchToken: searchToken)
            
        case .suggestionWithproducts:
            return craeteAutoSuggestWithproductsBody(searchConfig: searchConfig, searchToken: searchToken)
            
        case .categoryNavigation:
            return createCategoryNavigationBody(searchConfig: searchConfig, searchToken: searchToken)
            
        case .contentSearch:
            return createContentSearchBody(searchConfig: searchConfig, searchToken: searchToken)
        case .filterFetch:
            return createFilterFetch(searchConfig: searchConfig, searchToken: searchToken)
        default:
            return nil
        }
    }
    
    
    /**
     Creates a `SearchRequest` for performing a search feature.
     
     This method builds the query term, record settings, and a record query based on  the `requestId`.
     It returns a `SearchRequest` that contains the necessary data to
     perform the search.
     
     - Parameters:
      - searchConfig: The data set obtained for Search or Category navigation.
      - searchToken:  The token obtained from Monetate engine API.
     
     - Returns: A `SearchRequest` object configured for product search.
     */
    
    private func createSearchBody(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        
        let queryTerm = SearchRequest.QueryTerm(forSearch: searchConfig.searchTerm)
        let settings = SearchRequest.RecordSettings(query: queryTerm, limit: searchConfig.limit, offset: searchConfig.offset)
        let recordQuery = SearchRequest.RecordQuery(id: searchConfig.requestId, typeOfRequest: .search, settings: settings)
        return SearchRequest(recordQueries: [recordQuery], suggestions: [], searchToken: searchToken)
    }
    
    
    private func createAutoSuggestBody(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        let suggestTerm = SearchRequest.Suggestion(suggestionID: searchConfig.requestId, typeOfQuery: .autoSuggestion, query: searchConfig.searchTerm)
        return SearchRequest(recordQueries: [], suggestions: [suggestTerm], searchToken: searchToken)
    }
    
    private func craeteAutoSuggestWithproductsBody(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        let suggestTerm = SearchRequest.Suggestion(suggestionID: searchConfig.requestId, typeOfQuery: .autoSuggestion, query: searchConfig.searchTerm)
        
        let queryTerm = SearchRequest.QueryTerm(forSearch: searchConfig.searchTerm)
        let settings = SearchRequest.RecordSettings(query: queryTerm, limit: searchConfig.limit, offset: searchConfig.offset)
        let recordQuery = SearchRequest.RecordQuery(id: .productSearch, typeOfRequest: .search, settings: settings)
        
        return SearchRequest(recordQueries: [recordQuery], suggestions: [suggestTerm], searchToken: searchToken)
        
    }
    
    private func createCategoryNavigationBody(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        let queryTerm = SearchRequest.QueryTerm(forCategoryNav: searchConfig.categoryPath)
        let settings = SearchRequest.RecordSettings(query : queryTerm, limit: searchConfig.limit, offset: searchConfig.offset)
        let recordQuery = SearchRequest.RecordQuery(id: searchConfig.requestId, typeOfRequest: .categoryNavigation, settings: settings)
        return SearchRequest(recordQueries: [recordQuery], suggestions: [], searchToken: searchToken)
    }
    
    private func createContentSearchBody(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        let queryTerm = SearchRequest.QueryTerm(forSearch: searchConfig.searchTerm)
        let settings = SearchRequest.RecordSettings(forContentSearch: queryTerm, typeOfRecords: searchConfig.typeOfRecords, limit: searchConfig.limit, offset: searchConfig.offset)
        let recordQuery = SearchRequest.RecordQuery(id: searchConfig.requestId, typeOfRequest: .search, settings: settings)
        return SearchRequest(recordQueries: [recordQuery], suggestions: [], searchToken: searchToken)
    }
    
    private func createFilterFetch(searchConfig: SiteSearchConfigParams, searchToken: String?) -> SearchRequest {
        let queryTerm = SearchRequest.QueryTerm(forSearch: searchConfig.searchTerm)
        let settings = SearchRequest.RecordSettings(forFilterFetch: queryTerm, limit: searchConfig.limit)
        let recordQuery = SearchRequest.RecordQuery(forFileterFetch: searchConfig.requestId, typeOfRequest: .search, settings: settings, filterFacets: searchConfig.filterFacets)
        return SearchRequest(recordQueries: [recordQuery], suggestions: [], searchToken: searchToken)
    }
    
}
