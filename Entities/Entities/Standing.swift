//
//  Standings.swift
//  Entities
//
//  Created by Tuan Tang on 09/11/2022.
//

import Foundation

public struct Standing {
    public let id: String = UUID().uuidString
    public let rank: Int
    public let team: Team
    public let points: Int
    public let goalsDiff: Int
    public let group: String
    public let form: String
    public let status: String
    public let all: Workrate
    public let home: Workrate
    public let away: Workrate
}

extension Standing: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Standing, rhs: Standing) -> Bool {
        return lhs.id == rhs.id
    }
}

extension Standing: Decodable {
    enum CodingKeys: String, CodingKey {
        case rank, team, points, goalsDiff, group, form, status, all, home, away
    }
}
