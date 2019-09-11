//
//  Tweet.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import Foundation

class Tweet:  Decodable {
    
    //MARK: Properties
    
    let id: Int
    let firstName: String
    let lastName: String
    let profile: String
    let tweetText: String
    
    
    //MARK: Initialization
    
    init(id: Int, firstName: String, lastName: String, profile: String, tweetText: String) {
        
        // Initialize stored properties.
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.profile = profile
        self.tweetText = tweetText
    }
}

