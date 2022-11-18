//
//  FeedViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 03.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Мой пост")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let uiButton = UIButton()
        uiButton.backgroundColor = .blue
        uiButton.layer.cornerRadius = 12
        
        self.view.addSubview(uiButton)
        
        uiButton.setTitle("Перейти на пост", for: .normal)
        uiButton.setTitleColor(.lightGray, for: .normal)
        uiButton.translatesAutoresizingMaskIntoConstraints = false
        uiButton.addAction(UIAction(handler: { [self]_ in
            let vc = PostViewController()
            vc.titlePost = post.title
            self.navigationController?.pushViewController(vc, animated: true)
        }), for: .touchUpInside)
       
        NSLayoutConstraint.activate([
            uiButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            uiButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            uiButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            uiButton.heightAnchor.constraint(equalToConstant: 30)
        ])

        
    }
}

