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
        return table
    }()
    
    let header = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 200, height: 250))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PostTableViewCell
        let row = postArray[indexPath.row]
        cell.settingArray(array: row)
        return cell
    }

}
