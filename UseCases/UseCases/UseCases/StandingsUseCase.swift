//
//  StandingsUseCase.swift
//  UseCases
//
//  Created by Tuan Tang on 10/11/2022.
//

import Foundation
import Combine
import Services
import Entities

public protocol StandingsUseCaseType {
    func loadStandings(with season: Int, leaguesId: Int) -> AnyPublisher<Result<Response<[StandingsResponse]>, Error>, Never>
}

public class StandingsUseCase: StandingsUseCaseType {
    
    private let networkService: NetworkServiceType
    
    public init(networkService: NetworkServiceType) {
        self.networkService = networkService
    }
    
    public func loadStandings(with season: Int, leaguesId: Int) -> AnyPublisher<Result<Response<[StandingsResponse]>, Error>, Never> {
        return networkService
            .request(Resource<Response<[StandingsResponse]>>.standings(season, leaguesId))
            .map { .success($0) }
            .catch { error -> AnyPublisher<Result<Response<[StandingsResponse]>, Error>, Never> in
                .just(.failure(error))
            }
            .subscribe(on: Scheduler.backgroundWorkScheduler)
            .receive(on: Scheduler.mainScheduler)
            .eraseToAnyPublisher()
    }
    
}
