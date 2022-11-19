//
//  LogInViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 18.11.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    var scrollView = UIScrollView()
    
    
    let contentView = UIView()
    
    var logoVK: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        return logoImage
    }()
    

    var logInTextField: UITextField = {
        let email = UITextField()
        email.backgroundColor = .systemGray6
        email.textColor = .black
        email.font = .systemFont(ofSize: 16)
        email.textAlignment = .left
        email.layer.cornerRadius = 10
        email.layer.borderWidth = 0.5
        email.placeholder = "   Email or phone"
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
        password.layer.cornerRadius = 10
        password.layer.borderWidth = 0.5
        password.placeholder = "   Password"
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.autocapitalizationType = .none
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    var logInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "BlueVK")
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
        self.navigationController?.navigationBar.isHidden = true
        addMySubvire()
        setupScrollView()
    }
    
    func addMySubvire() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoVK)
        contentView.addSubview(logInTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(logInButton)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 600),
            
            logoVK.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoVK.widthAnchor.constraint(equalToConstant: 100),
            logoVK.heightAnchor.constraint(equalToConstant: 100),
            logoVK.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            
            
            logInTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            logInTextField.heightAnchor.constraint(equalToConstant: 50),
            logInTextField.topAnchor.constraint(equalTo: logoVK.bottomAnchor, constant: 120),
            
            
            passwordTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.topAnchor.constraint(equalTo: logInTextField.bottomAnchor),
            
            logInButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logInButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -32),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16)
        ])
    }

}
