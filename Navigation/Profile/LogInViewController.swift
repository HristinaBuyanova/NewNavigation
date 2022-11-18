//
//  LogInViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 18.11.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var VK: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    
    var logInView: UIView = {
        let loginView = UIView()
        loginView.layer.borderColor = UIColor.lightGray.cgColor
        loginView.layer.borderWidth = 0.5
        loginView.layer.cornerRadius = 10
        loginView.clipsToBounds = true
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()

    var emailOrPhoneTextField: UITextField = {
        let email = UITextField()
        email.backgroundColor = .systemGray6
        email.textColor = .black
        email.font = .systemFont(ofSize: 16)
        email.textAlignment = .left
        email.layer.borderWidth = 0.5
        email.placeholder = "Email or phone"
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.autocapitalizationType = .none
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    var passwordTextField: UITextField = {
        let password = UITextField()
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.font = .systemFont(ofSize: 16)
        password.textAlignment = .left
        password.layer.borderWidth = 0.5
        password.placeholder = "Password"
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(Any?.self, action: #selector(buttonState), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    @objc func buttonState() {
        if logInButton.isSelected {
            logInButton.alpha = 0.8
        } else if logInButton.isHighlighted {
            logInButton.alpha = 0.8
        } else if logInButton.isEnabled {
            logInButton.alpha = 0.8
        } else {
            logInButton.alpha = 1
        }
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        
    }
    

}
