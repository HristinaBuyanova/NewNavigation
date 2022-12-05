//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Христина Буянова on 04.12.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let reusableID = "PhotosCell"
    
    var photo: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotosCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhotosCell() {
        contentView.addSubview(photo)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func settingDataSource (array: Photo) {
        photo.image = UIImage(named: array.image)
    }
    
}
