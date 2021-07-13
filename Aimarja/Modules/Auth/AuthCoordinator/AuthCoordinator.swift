//
//  AuthCoordinator.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit
protocol AuthCoordinator: Coordinator {
    
}

class AuthCoordinatorImpl: AuthCoordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthorizationViewController.instantiate()
        vc.coodinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
