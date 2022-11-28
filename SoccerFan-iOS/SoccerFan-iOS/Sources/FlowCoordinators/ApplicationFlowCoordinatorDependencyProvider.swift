//
//  ApplicationFlowCoordinatorDependencyProvider.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 08/11/2022.
//

import UIKit

protocol ApplicationFlowCoordinatorDependencyProvider: AuthenticationFlowCoordinatorDependencyProvider, MainFlowCoordinatorDependencyProvider {}

protocol AuthenticationFlowCoordinatorDependencyProvider {
    func loginNavigationController() -> UINavigationController
}

protocol MainFlowCoordinatorDependencyProvider {
    func mainTabbarController() -> MainTabbarController
    func leaguesViewController(navigator: LeaguesNavigator) -> UINavigationController
    func standingsViewController(with season: Int, leaguesId: Int) -> UIViewController
}
