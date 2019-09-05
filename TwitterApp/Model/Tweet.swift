//
//  Tweet.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import UIKit

class Tweet {
    
    //MARK: Properties
    let user: User
    let message: String
    
    //MARK: Initialization
    init?(user: User, message: String){
        
        if message.isEmpty {
            return nil
        }
        
        //Initialize stored properties
        self.user = user
        self.message = message
    }
}
