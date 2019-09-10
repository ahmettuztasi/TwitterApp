//
//  HeaderViewController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class HeaderViewController: UITableViewController {
    
    let headerCellId = "headerCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.backgroundColor = .white
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: headerCellId)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: headerCellId, for: indexPath)
        cell.textLabel?.text = "Twitter"
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

