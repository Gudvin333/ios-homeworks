//
//  MainUITabBarController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

struct Post {
    var title: String
}

class MainUITabBarController: UITabBarController {
    
    let feedVC = FeedViewController()
    let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers() {
        let feedNavigationVc = UINavigationController(rootViewController: feedVC)
        tabBar.backgroundColor = .white
        feedVC.tabBarItem.title = "Лента"
        feedVC.tabBarItem.image = UIImage(systemName: "book")
        feedVC.navigationItem.title = "Лента"
        let profileNavigationVc = UINavigationController(rootViewController: profileVC)
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.navigationItem.title = "Профиль"
        
        viewControllers = [feedNavigationVc, profileNavigationVc]
    }
}
