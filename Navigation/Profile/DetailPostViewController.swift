//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Валентин Буров on 28.05.2022.
//

import UIKit

class DetailPostViewController: UIViewController {
    
    fileprivate var detailPost: PostPreview = PostPreview(author: "", image: UIImage(named: "bilbo")!, description: "", likes: 0, isLiked: false, views: 0)
 
    fileprivate let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemGray6
        return scrollView
    }()
    
    fileprivate let postView: UIView = {
        let postView = UIView()
        postView.translatesAutoresizingMaskIntoConstraints = false
        postView.backgroundColor = .systemGray6
        return postView
    }()
    
    fileprivate let postNameLabel: UILabel = {
        let postNameLabel = UILabel()
        postNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return postNameLabel
    }()
    
    fileprivate let postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .black
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        return postImageView
    }()
    
    fileprivate var postLikesLabel: UILabel = {
        let postlikesLabel = UILabel()
        postlikesLabel.translatesAutoresizingMaskIntoConstraints = false
        postlikesLabel.numberOfLines = 1
        postlikesLabel.textColor = .black
        postlikesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postlikesLabel.isUserInteractionEnabled = true
        return postlikesLabel
    }()
    
    fileprivate var postViewsLabel: UILabel = {
        let postViewsLabel = UILabel()
        postViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        postViewsLabel.textColor = .black
        postViewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return postViewsLabel
    }()
    
    fileprivate let postDescriptionLabel: UILabel = {
        let postDescriptionLabel = UILabel()
        postDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        postDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescriptionLabel.textColor = .black
        postDescriptionLabel.numberOfLines = 0
        postDescriptionLabel.textAlignment = .justified
        return postDescriptionLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupLayout()
        setupGestures()
    }
    
    func setupVC(index: Int, post: PostPreview) {
        detailPost = post
        detailPost.views = post.views + 1
        postNameLabel.text = post.author
        postImageView.image = post.image
        postDescriptionLabel.text = post.description
        postLikesLabel.text = "Likes: \(detailPost.likes)"
        postViewsLabel.text = "Views: \(detailPost.views)"
    }
    
    private func setupGestures() {
        let tapLikesGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        postLikesLabel.addGestureRecognizer(tapLikesGesture)
    }
    
    @objc func likeAction() {
        if detailPost.isLiked == false {
            detailPost.likes += 1
            detailPost.isLiked = true
        } else {
            detailPost.likes -= 1
            detailPost.isLiked = false
        }
        postLikesLabel.text = "Likes: \(detailPost.likes)"
    }
    
    private func setupLayout() {
        let inset: CGFloat = 16
        let aspectRatio: CGFloat = (postImageView.image?.size.height ?? 1) / (postImageView.image?.size.width ?? 1)
        [scrollView].forEach { view.addSubview($0) }
        [postView].forEach { scrollView.addSubview($0) }
        [postNameLabel, postImageView, postDescriptionLabel, postLikesLabel, postViewsLabel].forEach { postView.addSubview($0) }
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            postView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            postView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            postView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            postView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            postNameLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: inset),
            postNameLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            postImageView.topAnchor.constraint(equalTo: postNameLabel.bottomAnchor, constant: inset),
            postImageView.leadingAnchor.constraint(equalTo: postView.leadingAnchor),
            postImageView.widthAnchor.constraint(equalTo: postView.widthAnchor),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: aspectRatio),
            postDescriptionLabel.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: inset),
            postDescriptionLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            postDescriptionLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            postLikesLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: inset),
            postLikesLabel.leadingAnchor.constraint(equalTo: postView.leadingAnchor, constant: inset),
            postViewsLabel.topAnchor.constraint(equalTo: postDescriptionLabel.bottomAnchor, constant: inset),
            postViewsLabel.trailingAnchor.constraint(equalTo: postView.trailingAnchor, constant: -inset),
            postViewsLabel.bottomAnchor.constraint(equalTo: postView.bottomAnchor)
        ])
    }
}
