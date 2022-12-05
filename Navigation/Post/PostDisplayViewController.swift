//
//  PostDisplayViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 05.12.2022.
//

import UIKit

class PostDisplayViewController: UIViewController {

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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
