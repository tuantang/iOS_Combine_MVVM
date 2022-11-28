//
//  Workrate.swift
//  Entities
//
//  Created by Tuan Tang on 11/11/2022.
//

import Foundation

public struct Workrate {
    let played: Int
    let win: Int
    let draw: Int
    let lose: Int
    let goals: Goals
}

extension Workrate: Decodable {
    enum CodingKeys: String, CodingKey {
        case played, win, draw, lose, goals
    }
}

public struct Goals {
    let count: Int
    let against: Int
}

extension Goals: Decodable {
    enum CodingKeys: String, CodingKey {
        case count = "for"
        case against
    }
}
