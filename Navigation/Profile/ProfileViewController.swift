//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 03.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    let profileHeaderView = ProfileHeaderView()
    
    var buttonTitleChange: UIButton = {
        let buttonForTitle = UIButton()
        buttonForTitle.backgroundColor = .blue
        buttonForTitle.setTitle("Change Title", for: .normal)
        buttonForTitle.setTitleColor(UIColor.white, for: .normal)
        buttonForTitle.layer.cornerRadius = 4
        buttonForTitle.layer.shadowOffset = CGSize(width: 4, height: 4)
        buttonForTitle.layer.shadowRadius = 4
        buttonForTitle.layer.shadowColor = UIColor.black.cgColor
        buttonForTitle.layer.shadowOpacity = 0.7
        buttonForTitle.layer.masksToBounds = false
        buttonForTitle.addTarget(Any?.self, action: #selector(titleChange), for: .touchUpInside)
        buttonForTitle.translatesAutoresizingMaskIntoConstraints = false
        return buttonForTitle
    }()
    
    @objc func titleChange() {
            profileHeaderView.fullNameLabel.text = "New name"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Profile"
        setupView()
    }
    
    func setupView() {
        profileHeaderView.backgroundColor = .systemGray
        view.addSubview(profileHeaderView)
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonTitleChange)
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            buttonTitleChange.heightAnchor.constraint(equalToConstant: 50),
            buttonTitleChange.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            buttonTitleChange.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            buttonTitleChange.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
}
