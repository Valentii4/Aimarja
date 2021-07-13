//
//  Router.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit

protocol XibProtocol {
    static func instantiate() -> Self
}

extension XibProtocol where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        return Self.init(nibName: className, bundle: Bundle.main)
    }
}
