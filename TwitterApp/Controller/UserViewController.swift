//
//  UserViewController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import UIKit
import LBTAComponents
import SwiftyJSON
import Alamofire

class UserViewController: DatasourceController, ConnectionDelegate {
    
    
    let userCellId = "userCellId"
    
    var users : [User]? {
        didSet { collectionView?.reloadData()}
    }
    
    func successConnection(response: Data) {
        do{
            let responseModel = try JSONDecoder().decode([User].self, from: response)
            self.users = responseModel
        }catch{
            
        }
    }
    
    func errorConnection(message: String) {
        print(message)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        let service = Service(delegate: self)
        let headers = ["Content-Type":"application/json"]
        service.connectService(baseUrl: "http://localhost:3000/users", method: .get, header: headers, body: nil)
        
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: userCellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellId, for: indexPath) as? UserCell
        
        userCell?.nameLabel.text = users?[indexPath.item].firstName
        userCell?.bioTextView.text = users?[indexPath.item].lastName
        userCell?.usernameLabel.text = users?[indexPath.item].profile
        
        return userCell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 170)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //send data userView to TweetView
        let tweetViewController = TweetViewController()
        let delege : SendingDataUserVCtoTweetVC?
        delege = tweetViewController
        delege?.sendDataToTweetController(delege: (users?[indexPath.item].id)!)
        
        self.present(tweetViewController, animated: true, completion: nil)
    }
    
}
