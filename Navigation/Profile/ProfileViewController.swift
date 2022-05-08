//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate var profilePostHeaderView = ProfilePostHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    fileprivate func layout() {
        [profilePostHeaderView].forEach { view.addSubview($0) }
        NSLayoutConstraint.activate([
            profilePostHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profilePostHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profilePostHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profilePostHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
}
