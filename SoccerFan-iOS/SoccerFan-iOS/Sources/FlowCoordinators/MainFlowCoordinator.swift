//
//  MainFlowCoordinator.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 09/11/2022.
//

import UIKit

class MainFlowCoordinator: FlowCoordinator {
    
    fileprivate let window: UIWindow
    fileprivate var mainTabbarController: MainTabbarController?
    fileprivate let dependencyProvider: MainFlowCoordinatorDependencyProvider
    
    init(window: UIWindow, dependencyProvider: MainFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }
    
    func start() {
        let mainTabbarController = dependencyProvider.mainTabbarController()
        window.rootViewController = mainTabbarController
        self.mainTabbarController = mainTabbarController
        
        let leaguesNavigationController = dependencyProvider.leaguesViewController(navigator: self)
        let leaguesBarItem = UITabBarItem(title: "", image: Constants.Image.tabbarBallUnselected, selectedImage: Constants.Image.tabbarBallSelected)
        leaguesNavigationController.tabBarItem = leaguesBarItem
        
        mainTabbarController.viewControllers = [
            leaguesNavigationController
        ]
    }
    
    var rootViewController: UIViewController? {
        let selectedIndex = mainTabbarController?.tabBarController?.selectedIndex ?? 0
        if let navigationViewController = mainTabbarController?.viewControllers?[selectedIndex] as? UINavigationController {
            return navigationViewController.viewControllers.first
        }
        return mainTabbarController?.viewControllers?[selectedIndex]
    }
}

extension MainFlowCoordinator: LeaguesNavigator {
    func showStandings(with season: Int, leaguesId: Int) {
        let controller = dependencyProvider.standingsViewController(with: season, leaguesId: leaguesId)
        rootViewController?.navigationController?.pushViewController(controller, animated: true)
    }
}
 
