//
//  LeaguesViewModel.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import UIKit
import Combine

final class LeaguesViewModel: LeaguesViewModelType {
    
    private weak var navigator: LeaguesNavigator?
    private var cancellables: [AnyCancellable] = []
    
    init(navigator: LeaguesNavigator) {
        self.navigator = navigator
    }
    
    func transform(input: LeaguesViewModelInput) -> LeaguesViewModelOutput {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        input.selection
            .sink(receiveValue: { [unowned self] leaguesId in
                self.navigator?.showStandings(with: 2022, leaguesId: leaguesId)
            })
            .store(in: &cancellables)
        
        return PassthroughSubject().eraseToAnyPublisher()
    }
}
