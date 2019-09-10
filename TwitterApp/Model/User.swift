//
//  GetAllUserRM.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 07/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import Foundation

class User:  Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let profile: String
    
    init(id: Int, firstName: String, lastName: String, profile: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.profile = profile
    }
}
