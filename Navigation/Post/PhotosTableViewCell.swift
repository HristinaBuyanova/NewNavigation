//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Христина Буянова on 25.11.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    var pHotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var arrowButton: UIButton = {
        let arrow = UIButton()
        arrow.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        arrow.tintColor = .black
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()
    
    var firstPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo1")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var secondPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo2")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var thirdPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo3")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
     
    var fourthPhoto: UIImageView = {
        let photo = UIImageView()
        photo.image = UIImage(named: "Photo4")
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        photo.layer.cornerRadius = 6
        photo.translatesAutoresizingMaskIntoConstraints = false
        return photo
    }()
    
    var photoStackView: UIStackView = {
        let photoSV = UIStackView()
        photoSV.axis = .horizontal
        photoSV.distribution = .fillEqually
        photoSV.spacing = 8
        photoSV.translatesAutoresizingMaskIntoConstraints = false
        return photoSV
    }()
    
    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        photoStackView.addArrangedSubview(firstPhoto)
        photoStackView.addArrangedSubview(secondPhoto)
        photoStackView.addArrangedSubview(thirdPhoto)
        photoStackView.addArrangedSubview(fourthPhoto)
        
        contentView.addSubview(pHotoLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(photoStackView)
        
        NSLayoutConstraint.activate([
            pHotoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            pHotoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            arrowButton.centerYAnchor.constraint(equalTo: pHotoLabel.centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photoStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            photoStackView.topAnchor.constraint(equalTo: pHotoLabel.bottomAnchor, constant: 12),
            photoStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -24),
            photoStackView.heightAnchor.constraint(equalTo: firstPhoto.widthAnchor)
        ])
    }
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
