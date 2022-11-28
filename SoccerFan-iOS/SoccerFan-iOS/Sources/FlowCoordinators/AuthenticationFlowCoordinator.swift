//
//  AuthenticationFlowCoordinator.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 08/11/2022.
//

import UIKit

class AuthenticationFlowCoordinator: FlowCoordinator {
    
    fileprivate let window: UIWindow
    fileprivate var loginNavigationController: UINavigationController?
    fileprivate let dependencyProvider: AuthenticationFlowCoordinatorDependencyProvider
    
    init(window: UIWindow, dependencyProvider: AuthenticationFlowCoordinatorDependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }
    
    func start() {
        let loginNavigationController = dependencyProvider.loginNavigationController()
        window.rootViewController = loginNavigationController
        self.loginNavigationController = loginNavigationController
    }
}
