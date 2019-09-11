//
//  GetAllUserRM.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 07/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import Foundation

class User:  Decodable {
    
    //MARK: Properties
    
    let id: Int
    let firstName: String
    let lastName: String
    let profile: String
    
    
    //MARK: Initialization
    
    init(id: Int, firstName: String, lastName: String, profile: String) {
        
        // Initialize stored properties.
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.profile = profile
    }
}
