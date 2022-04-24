//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

var profileHeaderView: ProfileHeaderView!

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileHeaderView.profileImage)
        profileHeaderView.addSubview(profileHeaderView.profileName)
        profileHeaderView.addSubview(profileHeaderView.profileStatus)
        profileHeaderView.addSubview(profileHeaderView.profileButton)
    
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = CGRect(x: 0, y: 90, width: view.frame.width, height: view.frame.height)
    }
}
