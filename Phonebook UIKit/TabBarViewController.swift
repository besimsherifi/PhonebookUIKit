//
//  TabBarViewController.swift
//  Phonebook UIKit
//
//  Created by besim on 15/04/2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
           super.viewDidLoad()
           
           let firstVC = FirstViewController()
           firstVC.tabBarItem = UITabBarItem(title: "Favourites", image: UIImage(systemName: "star"), tag: 0)
           
           let secondVC = SecondViewController()
           secondVC.tabBarItem = UITabBarItem(title: "Recents", image: UIImage(systemName: "clock"), tag: 1)
           
           let thirdVC = ContactsViewController()
           thirdVC.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage(systemName: "person.circle"), tag: 2)
           
           let fourthVC = FourthViewController()
           fourthVC.tabBarItem = UITabBarItem(title: "Keypad", image: UIImage(systemName: "circle.grid.3x3"), tag: 3)
           
           let fifthVC = FifthViewController()
           fifthVC.tabBarItem = UITabBarItem(title: "Voicemail", image: UIImage(systemName: "phone.down"), tag: 4)
           
           let tabBarList = [firstVC, secondVC, thirdVC, fourthVC, fifthVC]
           
           viewControllers = tabBarList.map { UINavigationController(rootViewController: $0) }
       }

}
