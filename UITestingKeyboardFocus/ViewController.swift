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

        view.backgroundColor = .white

        let passwordField = UITextField()
        passwordField.backgroundColor = UIColor.white
        passwordField.placeholder = "Password"
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.keyboardType = .asciiCapable
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = .roundedRect

        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonDidTouchUpInside), for: .touchUpInside)
        button.setTitle("Login", for: .normal)

        view.addSubview(button)
        view.addSubview(passwordField)

        passwordField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 40).isActive = true

        button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: passwordField.widthAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func buttonDidTouchUpInside() {
        let alert = UIAlertController(title: "Loading", message: nil, preferredStyle: .alert)
        present(alert, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                alert.dismiss(animated: true) {
                    let controller = SearchViewController()
                    let navigation = UINavigationController(rootViewController: controller)
                    self.present(navigation, animated: true, completion: nil)
                }
            }
        }

    }
}

