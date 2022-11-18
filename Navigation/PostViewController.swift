//
//  PostViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 03.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    var titlePost: String = "Anonymous"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = titlePost
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(barButtonAction))
        
        navigationItem.rightBarButtonItem = barButton
        
        
    }
    
    @objc func barButtonAction() -> UIViewController {
        let infoVC = InfoViewController()
        self.present(infoVC, animated: true)
            return infoVC
    }
    
}
