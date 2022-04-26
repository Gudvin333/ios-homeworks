//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    fileprivate var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileHeaderView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
}
