//
//  AppCoordinator.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit
class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        if let _ = Session.shared.token{
            business()
        }else{
            auth()
        }
    }
    
    private func auth(){
        let coordinator = AuthCoordinatorImpl(navigationController: navigationController)
        coordinator.start()
    }
    
    private func business(){
        let coordinator = BusinessCoordinator(navigationController: navigationController)
        coordinator.start()
    }
}
