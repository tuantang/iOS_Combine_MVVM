//
//  League.swift
//  Entities
//
//  Created by Tuan Tang on 09/11/2022.
//

import Foundation

public struct League {
    public let id: Int
    public let name: String
    public let country: String
    public let logo: String
    public let flag: String
    public let season: Int
    public let standings: [[Standing]]
}

extension League: Hashable {
    public static func == (lhs: League, rhs: League) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension League: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, name, country, logo, flag, season, standings
    }
}
