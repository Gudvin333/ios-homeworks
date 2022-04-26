//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    let profileImage: UIImageView = {
        let profileImage = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        profileImage.image = UIImage(named: "bilbo")
        profileImage.contentMode = .scaleAspectFill
        profileImage.clipsToBounds = true
        profileImage.layer.cornerRadius = profileImage.frame.size.width / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        return profileImage
    }()
    let profileName: UILabel = {
        let profileName = UILabel(frame: CGRect(x: 125, y: 27, width: 200, height: 23))
        profileName.text = "Бильбо Бэгинс"
        profileName.backgroundColor = .lightGray
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        profileName.textColor = .black
        return profileName
    }()
    let profileStatus: UILabel = {
        let profileStatus = UILabel(frame: CGRect(x: 125, y: 68, width: 300, height: 30))
        profileStatus.text = "Отправился в путешествие"
        profileStatus.backgroundColor = .lightGray
        profileStatus.font = UIFont.systemFont(ofSize: 14)
        profileStatus.textColor = .gray
        return profileStatus
    }()
    lazy var profileButton: UIButton = {
        let profileButton = UIButton(frame: CGRect(x: 16, y: 132, width: UIScreen.main.bounds.width - 32, height: 50))
        profileButton.backgroundColor = .systemBlue
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOpacity = 0.7
        profileButton.setTitle("Показать статус", for: .normal)
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return profileButton
    }()
    
    @objc func buttonPressed() {
        print(profileStatus.text ?? "Статус пуст")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(profileImage)
        self.addSubview(profileName)
        self.addSubview(profileStatus)
        self.addSubview(profileButton)
        self.backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
