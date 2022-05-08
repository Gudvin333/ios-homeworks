//
//  ProfilePostHeaderView.swift
//  Navigation
//
//  Created by Валентин Буров on 08.05.2022.
//

import UIKit

class ProfilePostHeaderView: UITableView {
    
    fileprivate var profilePost = PostPreview.makeModel()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: .zero, style: .grouped)
        self.backgroundColor = .white
        self.separatorInset = .zero
        self.translatesAutoresizingMaskIntoConstraints = false
        self.dataSource = self
        self.delegate = self
        self.register(PostPreviewViewCell.self, forCellReuseIdentifier: PostPreviewViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ProfilePostHeaderView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostPreviewViewCell.identifier, for: indexPath) as! PostPreviewViewCell
        cell.setupCell(profilePost[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilePost.count
    }
    
}

extension ProfilePostHeaderView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let profileHeaderView = ProfileHeaderView()
        return profileHeaderView
    }
}
