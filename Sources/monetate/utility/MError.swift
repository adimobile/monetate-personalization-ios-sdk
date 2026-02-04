//
//  MonetatError.swift
//  monetate-ios-sdk
//
//  Created by Umar Sayyed on 09/12/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation

struct MError : Error, LocalizedError {
    let timestamp = Date().toString("E dd MM YY HH:mm:ss")
    let description : String // class level
    let domain : ErrorDomain
    let info: [String: Any]?
    
    var localizedDescription: String {
        if let info = info,
           let message = info["message"] as? String {
            return message
        }
        return NSLocalizedString(description, comment: "")
    }
    
    var errorDescription: String? {
          if let info = info,
             let message = info["message"] as? String {
              return message
          }
          return NSLocalizedString(description, comment: "")
      }
}


enum ErrorDomain: String {
    case APIError
    case ServerError
    case RuntimeError
    case ParseError
}

