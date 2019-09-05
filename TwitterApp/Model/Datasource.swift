//
//  HomeDatasource.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

//
//  HomeDatasource.swift
//  TwitterLBTA
//
//  Created by Brian Voong on 12/31/16.
//  Copyright © 2016 Lets Build That App. All rights reserved.
//

import LBTAComponents

class UserDatasource: Datasource {
    
    let users: [User] = {
        let brianUser = User(name: "Brian Voong", userName: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "categories"))
        
        let rayUser = User(name: "Ray Wenderlich", userName: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone developer and tweets on topics related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "homepage"))
        
        return [brianUser!, rayUser!]
    }()
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
    
}

