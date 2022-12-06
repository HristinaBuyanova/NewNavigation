//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Христина Буянова on 03.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 700
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "cell")
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "cellPhoto")
        return table
    }()
    
    let header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
//        title = "Profile"
        self.navigationController?.navigationBar.isHidden = true
        view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.tableHeaderView = header
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return postArray.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellPhoto", for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
            let row = postArray[indexPath.row]
            cell.settingArray(array: row)
            
            let tabGesture = UITapGestureRecognizer.init(target: self, action: #selector(addLike))
            tabGesture.numberOfTapsRequired = 1
            cell.numberOfLikesLabel.isUserInteractionEnabled = true
            cell.numberOfLikesLabel.addGestureRecognizer(tabGesture)
            cell.numberOfLikesLabel.tag = indexPath.row
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 165
        } else {
            return 700
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(PhotosViewController(), animated: true)
        } else if indexPath.section == 1 {
            if let customImage = UIImage(named: postArray[indexPath.row].image) {
                showPost(author: postArray[indexPath.row].author,
                         picture: customImage,
                         description: postArray[indexPath.row].description,
                         likes: postArray[indexPath.row].likes,
                         views: postArray[indexPath.row].views)
            }
            postArray[indexPath.row].views += 1
            tableView.reloadData()
        }
    }
    
    func showPost (author: String, picture: UIImage, description: String, likes: Int, views: Int) {
        

        let authorLabel = UILabel(frame: .zero)
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.numberOfLines = 2
        authorLabel.text = author
        authorLabel.textColor = .black
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let postImage = UIImageView()
        postImage.backgroundColor = .white
        postImage.image = picture
        postImage.contentMode = .scaleAspectFill
        postImage.clipsToBounds = true
        postImage.isUserInteractionEnabled = true
        postImage.translatesAutoresizingMaskIntoConstraints = false
        
        let textPost = UILabel(frame: .zero)
        textPost.font = UIFont.systemFont(ofSize: 14)
        textPost.textColor = .gray
        textPost.textAlignment = .center
        textPost.numberOfLines = 0
        textPost.text = description
        textPost.lineBreakMode = .byWordWrapping
        textPost.isUserInteractionEnabled = true
        textPost.translatesAutoresizingMaskIntoConstraints = false
        
        let likesLabel = UILabel(frame: .zero)
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        likesLabel.textColor = .gray
        likesLabel.numberOfLines = 2
        likesLabel.textAlignment = .left
        likesLabel.text = "Likes: \(likes)"
        likesLabel.isUserInteractionEnabled = true
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let viewLabel = UILabel(frame: .zero)
        viewLabel.font = UIFont.systemFont(ofSize: 16)
        viewLabel.textColor = .gray
        viewLabel.numberOfLines = 2
        viewLabel.textAlignment = .right
        viewLabel.text = "Views: \(views)"
        viewLabel.isUserInteractionEnabled = true
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let postView = UIView()
        postView.backgroundColor = .white
        postView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(postView)
        postView.addSubview(authorLabel)
        postView.addSubview(postImage)
        postView.addSubview(textPost)
        postView.addSubview(likesLabel)
        postView.addSubview(viewLabel)
        
        NSLayoutConstraint.activate([
            
            postView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: postView.topAnchor, constant: 50),
            authorLabel.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            authorLabel.heightAnchor.constraint(equalToConstant: 48),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor),
            postImage.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            postImage.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -16),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            
            textPost.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 8),
            textPost.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            textPost.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -16),
            textPost.heightAnchor.constraint(equalToConstant: 220),
            
            likesLabel.topAnchor.constraint(equalTo: textPost.bottomAnchor, constant: 16),
            likesLabel.leftAnchor.constraint(equalTo: postView.leftAnchor, constant: 16),
            likesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            viewLabel.topAnchor.constraint(equalTo: textPost.bottomAnchor, constant: 16),
            viewLabel.rightAnchor.constraint(equalTo: postView.rightAnchor, constant: -16),
            viewLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        let closePost = UITapGestureRecognizer(target: self, action: #selector(closePost))
        postView.addGestureRecognizer(closePost)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func closePost (_ tap: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        tap.view?.removeFromSuperview()
    }
    
    @objc func addLike(gesture: UITapGestureRecognizer) {
        let indexPath = IndexPath(row: gesture.view!.tag, section: 1)
        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        postArray[indexPath.row].likes += 1
        cell.numberOfLikesLabel.text = "Likes: \(postArray[indexPath.row].likes)"
    }

}
