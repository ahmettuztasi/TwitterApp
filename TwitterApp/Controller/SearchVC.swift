//
//  SearchVC.swift
//  TwitterApp
//
//  Created by KO on 12/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class SearchVC: DatasourceController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tweets = TweetViewController()
        tweets.viewDidLoad()
        collectionView?.backgroundColor = .white
    }
}
