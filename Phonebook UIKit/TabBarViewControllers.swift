//
//  TabBarViewControllers.swift
//  Phonebook UIKit
//
//  Created by besim on 15/04/2024.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            setupLabel(text: "Favourites")
        }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel(text: "Recents")
    }
}

class FourthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel(text: "Keypad")
    }
}

class FifthViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLabel(text: "Voicemail")
    }
}


extension UIViewController {
    func setupLabel(text: String) {
        let label = UILabel()
        label.text = text
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
