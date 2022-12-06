//
//  PhotoDisplayViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 05.12.2022.
//

import UIKit

class PhotoDisplayViewController: UIViewController {

    var indexPhotoRow: Int!

    lazy var photo: UIImageView = {
        let imagePhoto = UIImageView()
        imagePhoto.clipsToBounds = true
        imagePhoto.contentMode = .scaleAspectFit
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        imagePhoto.image = UIImage(named: photoGallery[indexPhotoRow].image)
        return imagePhoto
    }()

    lazy var buttonClose: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white

        self.view.addSubview(buttonClose)
        self.view.addSubview(photo)


        UIView.animate(withDuration: 0.7, delay: 0.2) {
            NSLayoutConstraint.activate([
                self.photo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.photo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.photo.heightAnchor.constraint(equalToConstant: 400),
                self.photo.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -20)
            ])
            self.photo.layoutIfNeeded()
        }


        UIView.animate(withDuration: 0.3, delay: 0.8) {
            NSLayoutConstraint.activate([
                self.buttonClose.bottomAnchor.constraint(equalTo: self.photo.topAnchor, constant: -5),
                self.buttonClose.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -10),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 50),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 50)
            ])
            self.buttonClose.layoutIfNeeded()
        }

    }


    @objc func closeWindow() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = .push
        transition.subtype = .fromRight
        self.view.window?.layer.add(transition, forKey: nil)
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
}
