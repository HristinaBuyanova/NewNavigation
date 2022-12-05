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
//            cell.arrowButton.addTarget(self, action: #selector(goToGallery), for: .touchUpInside)
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
            let row = postArray[indexPath.row]
            cell.settingArray(array: row)
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
        }
    }
    
    
//    @objc func goToGallery () {
//        let photoVC = PhotosViewController()
//        self.navigationController?.pushViewController(photoVC, animated: true)
//    }

}
