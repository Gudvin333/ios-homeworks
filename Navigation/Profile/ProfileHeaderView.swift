//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    fileprivate let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "bilbo")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    fileprivate let profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Бильбо Бэгинс"
        profileName.backgroundColor = .systemGray5
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        profileName.textColor = .black
        profileName.translatesAutoresizingMaskIntoConstraints = false
        return profileName
    }()
    fileprivate let profileStatus: UILabel = {
        let profileStatus = UILabel(frame: CGRect(x: 125, y: 68, width: 300, height: 30))
        profileStatus.text = "Отправился в путешествие"
        profileStatus.backgroundColor = .systemGray5
        profileStatus.font = UIFont.systemFont(ofSize: 14)
        profileStatus.textColor = .gray
        profileStatus.translatesAutoresizingMaskIntoConstraints = false
        return profileStatus
    }()
    fileprivate lazy var profileButton: UIButton = {
        let profileButton = UIButton()
        profileButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOpacity = 0.7
        profileButton.setTitle("Показать статус", for: .normal)
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        return profileButton
    }()
    
    @objc func buttonPressed() {
        print(profileStatus.text ?? "Статус пуст")
    }
    
    fileprivate func layout() {
        [profileImage, profileName, profileButton, profileStatus].forEach { self.addSubview($0) }
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -16),
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            profileName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileName.heightAnchor.constraint(equalToConstant: 50),
            profileStatus.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -37),
            profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            profileStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemGray5
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
