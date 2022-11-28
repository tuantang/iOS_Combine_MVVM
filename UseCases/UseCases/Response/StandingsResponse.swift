//
//  StandingsResponse.swift
//  UseCases
//
//  Created by Tuan Tang on 09/11/2022.
//

import Entities

public struct StandingsResponse: Decodable {
    public let league: League
    
    enum CodingKeys: String, CodingKey {
        case league
    }
}
