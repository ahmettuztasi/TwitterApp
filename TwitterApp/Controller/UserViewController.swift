//
//  UserViewController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class UserViewController: DatasourceController {
    
    let userCellId = "userCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: userCellId)
        
        let userDatasource = UserDatasource()
        self.datasource = userDatasource
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellId, for: indexPath)
        return userCell
    }
}
