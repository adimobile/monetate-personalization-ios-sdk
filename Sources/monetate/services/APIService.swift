//
//  APIService.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 13/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

/// Holds configuration constants for the Monetate API.
struct APIConfig {
    static let scheme = "https"
    static let domain = "engine.monetate.net"
    
    struct Paths {
        static let decide = "/api/engine/v1/decide/"
        static let search = "/api/search/v1/site-search/"
    }
    
    enum Endpoint: String {
        case search
        case reportClick = "report-click"
        case urlRedirect = "url-redirects"
        
        /// Builds path with given channel
        func path(for channel: String) -> String {
            switch self {
            case .search, .reportClick:
                return Paths.search + "\(channel)/\(self.rawValue)"
            case .urlRedirect:
                return Paths.search + "\(channel)/\(self.rawValue)"
            }
        }
        
        func method() -> Method {
            switch self {
            case .search, .reportClick:
                return .POST
            case .urlRedirect:
                return .GET
            }
        }
    }
}


func getSiteSearchURL(endpoint: APIConfig.Endpoint, preRequisite: SearchPreRequisite?) -> String? {
    var components = URLComponents()
    components.scheme = APIConfig.scheme
    components.host = APIConfig.domain
    components.path = endpoint.path(for: preRequisite?.channelData ?? "No channel")
    
    if endpoint == .urlRedirect, let actionId = preRequisite?.actionId {
        components.queryItems = [URLQueryItem(name: "actionId", value: "\(actionId)")]
    }
    
    return components.url?.absoluteString
}


enum TypeOfRequest: String, Codable {
    case search = "SEARCH"
    case autoSuggestion = "AUTO_SUGGESTIONS"
    case categoryNavigation = "CATNAV"
}

enum Method:String {
    case GET
    case POST
    case PUT
    case DELETE
}

class Service {
    static func getDecision(
        url: String,
        method: Method = .POST,
        body: [String: Any]? = nil,
        headers: [String: String]? = nil,
        success: @escaping (Data, Int, URLResponse) -> Void,
        failure: @escaping (Error?, Data?, Int?, URLResponse?) -> Void
    ) {
        guard let url = URL(string: url) else {
            failure(nil, nil, nil, nil) // Invalid URL error can be customized
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        if let body = body {
            request.httpBody = body.toData
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // 1. Handle network error first
            if let error = error {
                failure(error, data, nil, response)
                return
            }
            
            // 2. Ensure response is HTTPURLResponse
            guard let httpResponse = response as? HTTPURLResponse else {
                failure(nil, data, nil, response)
                return
            }
            
            let statusCode = httpResponse.statusCode
            
            // 3. Check for success status code (200–299)
            guard (200...299).contains(statusCode) else {
                failure(nil, data, statusCode, httpResponse)
                return
            }
            
            // 4. Ensure data exists
            guard let data = data else {
                failure(nil, nil, statusCode, httpResponse)
                return
            }
            
            
            // 5. Success callback
            success(data, statusCode, httpResponse)
        }.resume()
    }
}
