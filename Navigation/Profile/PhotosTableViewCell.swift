//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Валентин Буров on 21.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosView: UIView = {
        var photosView = UIView()
        photosView.translatesAutoresizingMaskIntoConstraints = false
        photosView.backgroundColor = .white
        return photosView
    }()
    
    private let photosLabel: UILabel = {
        var photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.text = "Photos"
        photosLabel.textColor = .black
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.numberOfLines = 1
        return photosLabel
    }()
    
    private var rightArrowImageView: UIImageView = {
        var rightArrowImageView = UIImageView()
        rightArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        rightArrowImageView.image = UIImage(systemName: "arrow.right")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        rightArrowImageView.sizeToFit()
        rightArrowImageView.clipsToBounds = false
        return rightArrowImageView
    }()
    
    private var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.layer.cornerRadius = 6
        stackView.backgroundColor = .white
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        return stackView
    }()
    
    private var firstImageView: UIImageView = {
        var firstImageView = UIImageView()
        firstImageView.translatesAutoresizingMaskIntoConstraints = false
        firstImageView.image = UIImage(named: "photo1")
        firstImageView.backgroundColor = .black
        firstImageView.contentMode = .scaleAspectFill
        firstImageView.layer.cornerRadius = 6
        firstImageView.clipsToBounds = true
        return firstImageView
    }()
    
    private var secondImageView: UIImageView = {
        var secondImageView = UIImageView()
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        secondImageView.image = UIImage(named: "photo2")
        secondImageView.backgroundColor = .black
        secondImageView.contentMode = .scaleAspectFill
        secondImageView.layer.cornerRadius = 6
        secondImageView.clipsToBounds = true
        return secondImageView
    }()
    
    private var thirdImageView: UIImageView = {
        var thirdImageView = UIImageView()
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false
        thirdImageView.image = UIImage(named: "photo3")
        thirdImageView.backgroundColor = .black
        thirdImageView.contentMode = .scaleAspectFill
        thirdImageView.layer.cornerRadius = 6
        thirdImageView.clipsToBounds = true
        return thirdImageView
    }()
    
    private var fourthImageView: UIImageView = {
        var fourthImageView = UIImageView()
        fourthImageView.translatesAutoresizingMaskIntoConstraints = false
        fourthImageView.image = UIImage(named: "photo4")
        fourthImageView.backgroundColor = .black
        fourthImageView.contentMode = .scaleAspectFill
        fourthImageView.layer.cornerRadius = 6
        fourthImageView.clipsToBounds = true
        return fourthImageView
    }()
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customizeCell() {
        photosView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupLayout() {
        let firstInset: CGFloat = 12
        let secondInset: CGFloat = 12
        [firstImageView, secondImageView, thirdImageView, fourthImageView].forEach { stackView.addArrangedSubview($0) }
        [photosView, photosLabel, rightArrowImageView, stackView].forEach { contentView.addSubview($0) }
        NSLayoutConstraint.activate([
            photosView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photosLabel.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            photosLabel.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            photosLabel.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            rightArrowImageView.topAnchor.constraint(equalTo: photosView.topAnchor, constant: firstInset),
            rightArrowImageView.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            rightArrowImageView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            rightArrowImageView.widthAnchor.constraint(equalToConstant: 24),
            rightArrowImageView.heightAnchor.constraint(equalToConstant: 28),
            stackView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: firstInset),
            stackView.leadingAnchor.constraint(equalTo: photosView.leadingAnchor, constant: firstInset),
            stackView.trailingAnchor.constraint(equalTo: photosView.trailingAnchor, constant: -firstInset),
            stackView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (firstInset * 2 + secondInset * 3)) / 4),
            stackView.bottomAnchor.constraint(equalTo: photosView.bottomAnchor, constant: -firstInset)
        ])
    }
}
