//
//  Team.swift
//  Entities
//
//  Created by Tuan Tang on 09/11/2022.
//

import Foundation

public struct Team {
    public let id: Int
    public let name: String
    public let logo: String
}

extension Team: Hashable {
    public static func == (lhs: Team, rhs: Team) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension Team: Decodable {
    enum CodingKeys: String, CodingKey {
        case id, name, logo
    }
}
