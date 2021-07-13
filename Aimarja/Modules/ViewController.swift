//
//  ViewController.swift
//  Aimarja
//
//  Created by Valentin Mironov on 13.07.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton()
        button.frame = CGRect(x: 10, y: 100, width: 100, height: 40)
        button.target(forAction: #selector(tap) , withSender: nil)
        view.addSubview(button)
    }
    
    @objc func tap(){
        let vc = BusinessViewController.instantiate()
        present(vc, animated: true, completion: nil)
    }

    @IBAction func test(_ sender: Any) {
        tap()
    }
    
}

