//
//  LogInViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 10.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    fileprivate var login: String = "Bilbo"
    fileprivate var password: String = "Ring"
    
    fileprivate let notificationCenter = NotificationCenter.default
    
    fileprivate let loginScroll: UIScrollView = {
        let loginScroll = UIScrollView()
        loginScroll.translatesAutoresizingMaskIntoConstraints = false
        return loginScroll
    }()
    
    fileprivate let loginView: UIView = {
        let loginView = UIView()
        loginView.backgroundColor = .white
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    fileprivate let logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFill
        logoImage.clipsToBounds = true
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    fileprivate var warning: UILabel = {
        let warning = UILabel()
        warning.text = ""
        warning.textColor = .red
        warning.font = UIFont.systemFont(ofSize: 10)
        warning.translatesAutoresizingMaskIntoConstraints = false
        return warning
    }()
    
    fileprivate var loginStackView: UIStackView = {
        let loginStackView = UIStackView()
        loginStackView.backgroundColor = .lightGray
        loginStackView.axis = .vertical
        loginStackView.distribution = .fillEqually
        loginStackView.layer.borderWidth = 0.5
        loginStackView.layer.borderColor = UIColor.lightGray.cgColor
        loginStackView.layer.cornerRadius = 10
        loginStackView.spacing = 0.5
        loginStackView.translatesAutoresizingMaskIntoConstraints = false
        return loginStackView
    }()
    
    fileprivate var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.backgroundColor = .systemGray5
        loginTextField.layer.cornerRadius = 10
        loginTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        loginTextField.placeholder = "Email or phone"
        loginTextField.textColor = .black
        loginTextField.font = UIFont.systemFont(ofSize: 16)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: loginTextField.frame.height))
        loginTextField.leftViewMode = .always
        return loginTextField
    }()
    
    fileprivate var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.backgroundColor = .systemGray5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        passwordTextField.placeholder = "Password"
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 10, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        return passwordTextField
    }()
    
    fileprivate lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log in", for: .normal)
        loginButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        return loginButton
    }()
    
    @objc private func buttonPressed() {
        warning.text = ""
        if loginTextField.text == login && passwordTextField.text == password {
            let profileView = ProfileViewController()
            profileView.title = "Профиль"
            navigationController?.pushViewController(profileView, animated: true)
        } else if (loginTextField.text == "" && passwordTextField.text == "") || loginTextField.text == "" || passwordTextField.text == "" {
            loginStackView.shake()
        } else if passwordTextField.text!.count < 3 && passwordTextField.text!.count >= 1 {
            warning.text = "The password can't be that short"
        } else if  (loginTextField.text != login && passwordTextField.text == password) || (loginTextField.text == login && passwordTextField.text != password) || (loginTextField.text != login && passwordTextField.text != password) {
            let alertController = UIAlertController(title: "Incorrect username or password", message: "Try again", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(OKAction)
            present(alertController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.isNavigationBarHidden = true
        loginTextField.delegate = self
        passwordTextField.delegate = self
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notificationCenter.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            loginScroll.contentInset.bottom = keyboardSize.height + 32
            loginScroll.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 32, right: 0)
        }
    }
    
    @objc private func keyboardHide() {
        loginScroll.contentInset = .zero
        loginScroll.verticalScrollIndicatorInsets = .zero
    }
    
    fileprivate func layout() {
        view.addSubview(loginScroll)
        NSLayoutConstraint.activate([
            loginScroll.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            loginScroll.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginScroll.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginScroll.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        loginScroll.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: loginScroll.topAnchor),
            loginView.leadingAnchor.constraint(equalTo: loginScroll.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: loginScroll.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: loginScroll.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: loginScroll.widthAnchor)
        ])
        
        [logoImage, loginStackView, loginButton, warning].forEach { loginView.addSubview($0) }
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            logoImage.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            loginStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            loginStackView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginStackView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginStackView.heightAnchor.constraint(equalToConstant: 100),
            warning.topAnchor.constraint(equalTo: loginStackView.bottomAnchor, constant: 5),
            warning.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            warning.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            warning.heightAnchor.constraint(equalToConstant: 15),
            loginButton.topAnchor.constraint(equalTo: warning.bottomAnchor, constant: 5),
            loginButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 0)
        ])
        
        [loginTextField, passwordTextField].forEach { loginStackView.addArrangedSubview($0) }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
