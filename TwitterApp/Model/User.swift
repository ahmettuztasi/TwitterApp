//
//  User.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class User {
    
    //MARK: Properties
    let name: String
    let userName: String
    let bioText: String
    let profileImage: UIImage?
    
    //MARK: Initialization
    init?(name: String, userName: String, bioText: String, profileImage: UIImage){
        
        if name.isEmpty || userName.isEmpty || bioText.isEmpty{
            return nil
        }
        
        //Initialize stored properties
        self.name = name
        self.userName = userName
        self.bioText = bioText
        self.profileImage = profileImage
    }
}
