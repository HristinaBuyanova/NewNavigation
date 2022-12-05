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
        imagePhoto.translatesAutoresizingMaskIntoConstraints = false
        imagePhoto.image = UIImage(named: photoGallery[indexPhotoRow].image)
        return imagePhoto
    }()
    
    lazy var buttonClose: UIButton = {
        let button = UIButton()
        let imageButton = UIImage(named: "xmark")
        button.tintColor = .black
        button.setBackgroundImage(UIImage(named: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(closeWindow), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tabBarController?.tabBar.isHidden = true
        view.backgroundColor = .white
        
        self.view.addSubview(photo)
        self.view.addSubview(buttonClose)
        
        UIView.animate(withDuration: 0.5, delay: 0.3) {
            NSLayoutConstraint.activate([
                self.photo.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.photo.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
                self.photo.heightAnchor.constraint(equalToConstant: 350),
                self.photo.widthAnchor.constraint(equalToConstant: 350)
            ])
            self.photo.layoutIfNeeded()
        }

        
        UIView.animate(withDuration: 0.3, delay: 0.7) {
            NSLayoutConstraint.activate([
                self.buttonClose.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                self.buttonClose.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
                self.buttonClose.heightAnchor.constraint(equalToConstant: 100),
                self.buttonClose.widthAnchor.constraint(equalToConstant: 100)
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
