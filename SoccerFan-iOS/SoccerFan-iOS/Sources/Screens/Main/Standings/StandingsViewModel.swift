//
//  StandingsViewModel.swift
//  SoccerFan-iOS
//
//  Created by Tuan Tang on 10/11/2022.
//

import UIKit
import Combine
import Services
import UseCases
import Entities

class StandingsViewModel: StandingsViewModelType {
    
    private let season: Int
    private let leaguesId: Int
    private let usecase: StandingsUseCaseType
        
    init(season: Int, leaguesId: Int, usecase: StandingsUseCaseType) {
        self.season = season
        self.leaguesId = leaguesId
        self.usecase = usecase
    }
    
    func transform(input: StandingsViewModelInput) -> StandingsViewModelOutput {
        let standings = input.appear
            .flatMap { [unowned self] _ in self.usecase.loadStandings(with: self.season, leaguesId: self.leaguesId) }
            .map({ result -> StandingsState in
                switch result {
                case .success(let result):
                    guard let league = result.response?.first?.league else { return .noResults }
                    let viewModel = LeagueStandingsViewModel(league: league, standings: league.standings.first ?? [])
                    return .success(viewModel)
                case .failure(let error):
                    print(error.localizedDescription)
                    return .failure(error)
                }
            })
            .eraseToAnyPublisher()
        
        let loading: StandingsViewModelOutput = input.appear.map({ _ in .loading }).eraseToAnyPublisher()
        
        return Publishers.Merge(loading, standings).removeDuplicates().eraseToAnyPublisher()
    }
    
}
