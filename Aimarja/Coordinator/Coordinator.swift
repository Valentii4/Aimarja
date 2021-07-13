//
//  Coordinator.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit
protocol Coordinator {
    var navigationController: UINavigationController { get set }
    init(navigationController: UINavigationController)
    func start()
}
