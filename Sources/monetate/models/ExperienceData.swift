//
//  ExperienceData.swift
//  monetate-ios-sdk
//
//  Created by Hasanul Benna(UST,IN) on 30/06/25.
//  Copyright © 2025 Monetate. All rights reserved.
//

import Foundation

struct ExperienceDataResponse: Codable {
    let data: ExperienceDataContainer?

    enum CodingKeys: String, CodingKey {
        case data
    }
}

struct ExperienceDataContainer: Codable {
    let experienceResponses: [ExperienceResponse]?

    enum CodingKeys: String, CodingKey {
        case experienceResponses = "responses"
    }
}

struct ExperienceResponse: Codable {
    let experienceActions: [ExperienceAction]?

    enum CodingKeys: String, CodingKey {
        case experienceActions = "actions"
    }
}

struct ExperienceAction: Codable {
    let actionType: String?
    let actionId: Int?
    let searchToken: String?

    enum CodingKeys: String, CodingKey {
        case actionType
        case actionId
        case searchToken
    }
}
