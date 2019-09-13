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
        let tweetViewController =  TweetViewController()
        tweetViewController.tabBarItem.image = UIImage(named: "homepage")
        //tweetViewController.title = "Tweets"
        //homePageController.tabBarItem.selectedImage = UIImage(named: "homepageBlack")
        
        let searchViewController = SearchVC()
        searchViewController.tabBarItem.image = UIImage(named: "categories")
        //searchViewController.title = "Categories"
        //searchViewController.tabBarItem.selectedImage = UIImage(named: "categroiesBlack")
        
        let notificationViewController = NotificationVC()
        notificationViewController.tabBarItem.image = UIImage(named: "notification")
        //notificationViewController.title = "Notifications"
        //searchViewController.tabBarItem.selectedImage = UIImage(named: "categroiesBlack")
        
        let inBoxViewController = InBoxVC()
        inBoxViewController.tabBarItem.image = UIImage(named: "inbox")
        //inBoxViewController.title = "InBox"
        //searchViewController.tabBarItem.selectedImage = UIImage(named: "categroiesBlack")
        
        viewControllers = [tweetViewController, searchViewController, notificationViewController, inBoxViewController]
    }
}

