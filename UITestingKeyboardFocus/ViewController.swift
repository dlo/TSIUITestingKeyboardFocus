//
//  ViewController.swift
//  UITestingKeyboardFocus
//
//  Created by Daniel Loewenherz on 1/3/17.
//  Copyright © 2017 Lionheart Software LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.red

        let button = UIButton(frame: CGRect(origin: view.center, size: CGSize(width: 100, height: 100)))
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)

        view.addSubview(button)
    }

    func buttonDidTouchUpInside() {
        let controller = SearchViewController()
        let navigation = UINavigationController(rootViewController: controller)
        present(navigation, animated: true, completion: nil)
    }
}

