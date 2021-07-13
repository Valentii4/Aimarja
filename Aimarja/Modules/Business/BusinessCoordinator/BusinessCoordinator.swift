//
//  BusinessCoordinator.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit
class BusinessCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    required init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    func start() {
        let vc = BusinessViewController.instantiate()
        navigationController.pushViewController(vc, animated: true)
    }
}
