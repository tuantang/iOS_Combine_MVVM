//
//  StandingViewModel.swift
//  SoccerFan-iOS
//
//  Created by Tuan Tang on 14/11/2022.
//

import Entities

struct LeagueStandingsViewModel {
    let id: String = UUID().uuidString
    let league: League
    let standings: [Standing]
}

extension LeagueStandingsViewModel: Hashable {
    static func == (lhs: LeagueStandingsViewModel, rhs: LeagueStandingsViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct StandingViewModel {
    let id: String = UUID().uuidString
    let rank: Int
    let name: String
    let logo: String
}

extension StandingViewModel: Hashable {
    static func == (lhs: StandingViewModel, rhs: StandingViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
