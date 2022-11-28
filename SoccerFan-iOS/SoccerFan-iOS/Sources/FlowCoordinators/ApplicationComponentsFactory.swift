//
//  ApplicationComponentsFactory.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 08/11/2022.
//

import UIKit
import Services
import UseCases

class ApplicationComponentsFactory {
    fileprivate lazy var standingsUseCase: StandingsUseCaseType = StandingsUseCase(networkService: servicesProvider.network)
    
    private let servicesProvider: ServicesProvider
    
    init(servicesProvider: ServicesProvider = ServicesProvider.defaultProvider()) {
        self.servicesProvider = servicesProvider
    }
}

extension ApplicationComponentsFactory: ApplicationFlowCoordinatorDependencyProvider {

    func loginNavigationController() -> UINavigationController {
        let loginViewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: loginViewController)
        return navigationController
    }
    
    func mainTabbarController() -> MainTabbarController {
        let mainTabbarController = MainTabbarController()
        return mainTabbarController
    }
    
    func leaguesViewController(navigator: LeaguesNavigator) -> UINavigationController {
        let viewModel = LeaguesViewModel(navigator: navigator)
        let viewController = LeaguesViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
    func standingsViewController(with season: Int, leaguesId: Int) -> UIViewController {
        let viewModel = StandingsViewModel(season: season, leaguesId: leaguesId, usecase: standingsUseCase)
        return StandingsViewController(viewModel: viewModel)
    }
}
