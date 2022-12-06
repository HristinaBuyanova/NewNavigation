//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Христина Буянова on 22.11.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let authorPost: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let imagePost: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .black
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let descriptionTextLabel: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 14)
        text.textColor = .systemGray
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let numberOfLikesLabel: UILabel = {
        let likes = UILabel()
        likes.font = .systemFont(ofSize: 16)
        likes.textColor = .black
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()
    
    let numberOfViewsLabel: UILabel = {
        let views = UILabel()
        views.font = .systemFont(ofSize: 16)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMyView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addMyView () {
        contentView.addSubview(authorPost)
        contentView.addSubview(imagePost)
        contentView.addSubview(descriptionTextLabel)
        contentView.addSubview(numberOfLikesLabel)
        contentView.addSubview(numberOfViewsLabel)
    }
    
    func setupView() {
        NSLayoutConstraint.activate([
            
            authorPost.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 16),
            authorPost.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            authorPost.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            imagePost.topAnchor.constraint(equalTo: authorPost.bottomAnchor, constant: 16),
            imagePost.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imagePost.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imagePost.heightAnchor.constraint(equalTo: contentView.widthAnchor),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            descriptionTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            descriptionTextLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            
            numberOfLikesLabel.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            numberOfViewsLabel.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 16),
            numberOfViewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func settingArray(array: PostNew) {
        authorPost.text = array.author
        imagePost.image = UIImage(named: array.image)
        descriptionTextLabel.text = array.description
        numberOfLikesLabel.text = "Likes: \(array.likes)"
        numberOfViewsLabel.text = "Views: \(array.views)"
    }
}

