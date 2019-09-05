//
//  CustomTabBarController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let userViewController = UserViewController()
        userViewController.tabBarItem.image = UIImage(named: "homepage")
        //homePageController.tabBarItem.selectedImage = UIImage(named: "homepageBlack")
        
        let tweetViewController = TweetViewController()
        tweetViewController.tabBarItem.image = UIImage(named: "categories")
        //myFavoritesController.tabBarItem.selectedImage = UIImage(named: "categroiesBlack")
        
        viewControllers = [userViewController, tweetViewController]
    }
}

