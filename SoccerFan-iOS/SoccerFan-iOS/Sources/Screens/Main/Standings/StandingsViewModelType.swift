//
//  StandingsViewModelType.swift
//  SoccerFan-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import Combine
import Entities

/// Input
struct StandingsViewModelInput {
    let appear: AnyPublisher<Void, Never>
}

/// Output
enum StandingsState {
    case loading
    case success(LeagueStandingsViewModel)
    case failure(Error)
    case noResults
}

extension StandingsState: Equatable {
    static func == (lhs: StandingsState, rhs: StandingsState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.success, .success):
            return lhs == rhs
        case (.failure, .failure):
            return true
        default:
            return false
        }
    }
}


typealias StandingsViewModelOutput = AnyPublisher<StandingsState, Never>

protocol StandingsViewModelType {
    func transform(input: StandingsViewModelInput) -> StandingsViewModelOutput
}
