//
//  LeaguesViewModelType.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import Combine
import Services

/// Input
struct LeaguesViewModelInput {
    /// called when a screen becomes visible
    let appear: AnyPublisher<Void, Never>
    /// called when the user selected an item from the list
    let selection: AnyPublisher<Int, Never>
}

enum LeaguesState {
    case loading
    case success
    case failure(APIError)
}

typealias LeaguesViewModelOutput = AnyPublisher<LeaguesState, Never>

protocol LeaguesViewModelType {
    func transform(input: LeaguesViewModelInput) -> LeaguesViewModelOutput
}
