//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    fileprivate lazy var profileImagePosition = profileImage.layer.position
    fileprivate lazy var profileImageBounds = profileImage.layer.bounds
    
    fileprivate let imageView: UIView = {
        let imageView = UIView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.isUserInteractionEnabled = false
        imageView.alpha = 0.0
        return imageView
    }()
    fileprivate lazy var closeProfileImageButton: UIButton = {
        let closeProfileImageButton = UIButton()
        closeProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        closeProfileImageButton.setImage(UIImage(systemName: "multiply", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        closeProfileImageButton.alpha = 0.0
        closeProfileImageButton.clipsToBounds = false
        closeProfileImageButton.addTarget(self, action: #selector(closeAvatarAction), for: .touchUpInside)
        closeProfileImageButton.isUserInteractionEnabled = false
        return closeProfileImageButton
    }()
    fileprivate let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = UIImage(named: "bilbo")
        profileImage.contentMode = .scaleAspectFill
        profileImage.layer.cornerRadius = 50
        profileImage.clipsToBounds = true
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.isUserInteractionEnabled = true
        return profileImage
    }()
    fileprivate let profileName: UILabel = {
        let profileName = UILabel()
        profileName.text = "Бильбо Бэгинс"
        profileName.backgroundColor = .systemGray6
        profileName.font = UIFont.boldSystemFont(ofSize: 18)
        profileName.textColor = .black
        profileName.translatesAutoresizingMaskIntoConstraints = false
        return profileName
    }()
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.placeholder = "Установите статус.."
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.backgroundColor = .systemGray6
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 10
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        return statusTextField
    }()
    fileprivate let profileStatus: UILabel = {
        let profileStatus = UILabel(frame: CGRect(x: 125, y: 68, width: 300, height: 30))
        profileStatus.text = "Отправился в путешествие"
        profileStatus.backgroundColor = .systemGray6
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
        profileButton.setTitle("Сменить статус", for: .normal)
        profileButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        return profileButton
    }()
    
    @objc func buttonPressed() {
        if statusTextField.text?.count ?? 0 >= 1 {
            profileStatus.text = statusTextField.text
        } else {
            statusTextField.shake()
        }
    }
    private func setupGestures() {
        let tapProfileImageGesture = UITapGestureRecognizer(target: self, action: #selector(tapProfileImageAction))
        profileImage.addGestureRecognizer(tapProfileImageGesture)
    }
    
    @objc func tapProfileImageAction() {
        
        self.profileImagePosition = self.profileImage.layer.position
        self.profileImageBounds = self.profileImage.layer.bounds
        
        UIImageView.animate(withDuration: 0.5, animations: {
            self.profileImage.center = CGPoint(x: UIScreen.main.bounds.midX, y: (UIScreen.main.bounds.midY - ProfileViewController.tableView.contentOffset.y))
            self.imageView.alpha = 0.8
            self.profileImage.layer.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            self.profileImage.layer.cornerRadius = 0
            self.profileImage.layer.borderWidth = 0
            self.profileImage.isUserInteractionEnabled = false
            self.profileButton.isUserInteractionEnabled = false
            ProfileViewController.tableView.isScrollEnabled = false
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = false
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 1))?.isUserInteractionEnabled = false
        }, completion: { _ in UIImageView.animate(withDuration: 0.3) {
            self.closeProfileImageButton.alpha = 1
            self.closeProfileImageButton.isUserInteractionEnabled = true
            self.layoutIfNeeded()
        }})
    }
    
    @objc private func closeAvatarAction() {
        UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.0, options: .curveEaseInOut) {
            self.closeProfileImageButton.alpha = 0
            self.closeProfileImageButton.isUserInteractionEnabled = false
        } completion: { _ in UIView.animate(withDuration: 0.5, delay: 0.0) {
            self.imageView.alpha = 0.0
            self.profileImage.layer.position = self.profileImagePosition
            self.profileImage.layer.bounds = self.profileImageBounds
            self.profileImage.layer.cornerRadius = self.profileImage.bounds.width / 2
            self.profileImage.layer.borderWidth = 3
            self.profileImage.isUserInteractionEnabled = true
            self.profileButton.isUserInteractionEnabled = true
            ProfileViewController.tableView.isScrollEnabled = true
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 0))?.isUserInteractionEnabled = true
            ProfileViewController.tableView.cellForRow(at: IndexPath(item: 0, section: 1))?.isUserInteractionEnabled = true
            self.layoutIfNeeded()
        }}
    }

    
    fileprivate func layout() {
        [statusTextField, profileName, profileButton, profileStatus, imageView, profileImage, closeProfileImageButton].forEach { self.addSubview($0) }
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            closeProfileImageButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
            closeProfileImageButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32),
            profileImage.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileButton.heightAnchor.constraint(equalToConstant: 60),
            profileButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            profileName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileName.heightAnchor.constraint(equalToConstant: 50),
            statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            profileStatus.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -60),
            profileStatus.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            profileStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        layout()
        setupGestures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
