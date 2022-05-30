//
//  FeedViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 24.04.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    fileprivate struct Post {
        var title: String
    }
    
    fileprivate var newsPost: Post = {
        let newsPost = Post(title: "Новости мира")
        return newsPost
    }()
    
    fileprivate var artPost: Post = {
        let newsPost = Post(title: "Новости искусства")
        return newsPost
    }()
    
    fileprivate var feedStackView: UIStackView = {
        let feedStackView = UIStackView()
        feedStackView.backgroundColor = .lightGray
        feedStackView.axis = .vertical
        feedStackView.distribution = .fillEqually
        feedStackView.spacing = 10
        feedStackView.translatesAutoresizingMaskIntoConstraints = false
        return feedStackView
    }()
    
    fileprivate lazy var firstFeedButton: UIButton = {
        let firstFeedButton = UIButton()
        firstFeedButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        firstFeedButton.layer.cornerRadius = 4
        firstFeedButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        firstFeedButton.layer.shadowRadius = 4
        firstFeedButton.layer.shadowColor = UIColor.black.cgColor
        firstFeedButton.layer.shadowOpacity = 0.7
        firstFeedButton.setTitle(newsPost.title, for: .normal)
        firstFeedButton.addTarget(self, action: #selector(newsTapAction), for: .touchUpInside)
        firstFeedButton.translatesAutoresizingMaskIntoConstraints = false
        return firstFeedButton
    }()
    
    fileprivate lazy var secondFeedButton: UIButton = {
        let secondFeedButton = UIButton()
        secondFeedButton.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        secondFeedButton.layer.cornerRadius = 4
        secondFeedButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        secondFeedButton.layer.shadowRadius = 4
        secondFeedButton.layer.shadowColor = UIColor.black.cgColor
        secondFeedButton.layer.shadowOpacity = 0.7
        secondFeedButton.setTitle(artPost.title, for: .normal)
        secondFeedButton.addTarget(self, action: #selector(artTapAction), for: .touchUpInside)
        secondFeedButton.translatesAutoresizingMaskIntoConstraints = false
        return secondFeedButton
    }()
    
    @objc private func newsTapAction() {
        let postVC = PostViewController()
        postVC.title = newsPost.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    @objc private func artTapAction() {
        let postVC = PostViewController()
        postVC.title = artPost.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    fileprivate func layout() {
        view.addSubview(feedStackView)
        
        [firstFeedButton, secondFeedButton].forEach { feedStackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            feedStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            feedStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            feedStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            feedStackView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
