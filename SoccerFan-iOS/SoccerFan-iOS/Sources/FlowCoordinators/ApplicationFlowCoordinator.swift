//
//  ApplicationFlowCoordinator.swift
//  MVVM-Combine-iOS
//
//  Created by Tuan Tang on 08/11/2022.
//

import UIKit

class ApplicationFlowCoordinator: FlowCoordinator {
    
    typealias DependencyProvider = ApplicationFlowCoordinatorDependencyProvider
    
    private let window: UIWindow
    private let dependencyProvider: DependencyProvider
    private var childCoordinators: [FlowCoordinator] = []
    
    init(window: UIWindow, dependencyProvider: DependencyProvider) {
        self.window = window
        self.dependencyProvider = dependencyProvider
    }
    
    func start() {
//        let authenticationFlowCoordinator = AuthenticationFlowCoordinator(window: window, dependencyProvider: dependencyProvider)
//        childCoordinators = [authenticationFlowCoordinator]
//        authenticationFlowCoordinator.start()
        
        let mainFlowCoordinator = MainFlowCoordinator(window: window, dependencyProvider: dependencyProvider)
        childCoordinators = [mainFlowCoordinator]
        mainFlowCoordinator.start()
    }
}


