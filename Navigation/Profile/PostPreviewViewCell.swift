//
//  PostPreviewViewCell.swift
//  Navigation
//
//  Created by Валентин Буров on 08.05.2022.
//

import UIKit

class PostPreviewViewCell: UITableViewCell {
    
    fileprivate let postPreviewView: UIView = {
        let postPreviewView = UIView()
        postPreviewView.backgroundColor = .white
        postPreviewView.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewView
    }()
    
    fileprivate let postPreviewNameLabel: UILabel = {
        let postPreviewNameLabel = UILabel()
        postPreviewNameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        postPreviewNameLabel.textColor = .black
        postPreviewNameLabel.numberOfLines = 2
        postPreviewNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewNameLabel
    }()
    
    fileprivate let postPreviewImage: UIImageView = {
       let postPreviewImage = UIImageView()
        postPreviewImage.backgroundColor = .black
        postPreviewImage.contentMode = .scaleAspectFit
        postPreviewImage.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewImage
    }()
    
    fileprivate let postPreviewDescriptionLabel: UILabel = {
        let postPreviewDescriptionLabel = UILabel()
        postPreviewDescriptionLabel.font = UIFont.systemFont(ofSize: 14)
        postPreviewDescriptionLabel.textColor = .systemGray
        postPreviewDescriptionLabel.numberOfLines = 0
        postPreviewDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewDescriptionLabel
    }()
    
    fileprivate let postPreviewLikesLabel: UILabel = {
        let postPreviewLikesLabel = UILabel()
        postPreviewLikesLabel.font = UIFont.systemFont(ofSize: 16)
        postPreviewLikesLabel.textColor = .black
        postPreviewLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewLikesLabel
    }()
    
    fileprivate let postPreviewViewsLabel: UILabel = {
        let postPreviewViewsLabel = UILabel()
        postPreviewViewsLabel.font = UIFont.systemFont(ofSize: 16)
        postPreviewViewsLabel.textColor = .black
        postPreviewViewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return postPreviewViewsLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ postPreview: PostPreview) {
        postPreviewNameLabel.text = postPreview.author
        postPreviewImage.image = postPreview.image
        postPreviewDescriptionLabel.text = postPreview.description
        postPreviewLikesLabel.text = "Likes: \(postPreview.likes)"
        postPreviewViewsLabel.text = "Views: \(postPreview.views)"
    }
    
    fileprivate func layout() {
        [postPreviewView, postPreviewNameLabel, postPreviewImage, postPreviewDescriptionLabel, postPreviewLikesLabel, postPreviewViewsLabel].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            postPreviewView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            postPreviewView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            postPreviewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            postPreviewView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            postPreviewNameLabel.topAnchor.constraint(equalTo: postPreviewView.topAnchor, constant: 16),
            postPreviewNameLabel.leadingAnchor.constraint(equalTo: postPreviewView.leadingAnchor, constant: 16),
            postPreviewNameLabel.trailingAnchor.constraint(equalTo: postPreviewView.trailingAnchor, constant: 16),
            
            postPreviewImage.topAnchor.constraint(equalTo: postPreviewNameLabel.bottomAnchor, constant: 12),
            postPreviewImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postPreviewImage.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            postPreviewDescriptionLabel.topAnchor.constraint(equalTo: postPreviewImage.bottomAnchor, constant: 16),
            postPreviewDescriptionLabel.leadingAnchor.constraint(equalTo: postPreviewView.leadingAnchor, constant: 16),
            postPreviewDescriptionLabel.trailingAnchor.constraint(equalTo: postPreviewView.trailingAnchor, constant: -16),
            
            postPreviewLikesLabel.topAnchor.constraint(equalTo: postPreviewDescriptionLabel.bottomAnchor, constant: 16),
            postPreviewLikesLabel.leadingAnchor.constraint(equalTo: postPreviewView.leadingAnchor, constant: 16),
            postPreviewLikesLabel.bottomAnchor.constraint(equalTo: postPreviewView.bottomAnchor, constant: -16),
            
            postPreviewViewsLabel.topAnchor.constraint(equalTo: postPreviewDescriptionLabel.bottomAnchor, constant: 16),
            postPreviewViewsLabel.trailingAnchor.constraint(equalTo: postPreviewView.trailingAnchor, constant: -16),
            postPreviewViewsLabel.bottomAnchor.constraint(equalTo: postPreviewView.bottomAnchor, constant: -16)
        ])
    }
}
