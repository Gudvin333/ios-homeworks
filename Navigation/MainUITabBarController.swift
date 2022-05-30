//
//  MainUITabBarController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class MainUITabBarController: UITabBarController {
    
    let feedVC = FeedViewController()
    let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNavigationVc = UINavigationController(rootViewController: feedVC)
        tabBar.backgroundColor = .white
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "book")
        feedVC.navigationItem.title = "Лента"
        let loginNavigationVc = UINavigationController(rootViewController: loginVC)
        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person")
        
        viewControllers = [feedNavigationVc, loginNavigationVc]
    }
}
