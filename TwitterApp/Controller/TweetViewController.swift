//
//  TweetViewController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents


class TweetViewController: DatasourceController, MyDataSendingDelegate, ConnectionDelegate {
  
    var userId: Int? {
        didSet {getTweetById(id: userId!)}
    }
    
    let tweetCellId = "tweetCellId"
    
    
    var tweet : [Tweet]? {
        didSet { collectionView?.reloadData()}
    }
    
    func successConnection(response: Data) {
        print("Response \(response)")
        do {
            self.tweet = try JSONDecoder().decode([Tweet].self, from: response)
        } catch { print(error)}
        
    }
    
    func errorConnection(message: String) {
        print("Response \(message)")
    }
    
    
    
    func sendDataToTweetController(delege: Int) {
        self.userId = delege
    }
    
    func getTweet(tweet: [Tweet]) {
        self.tweet = tweet
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        collectionView?.backgroundColor = .white
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweet?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let tweetCell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as! TweetCell
        if(self.tweet != nil){
            tweetCell.messageTextView.text = self.tweet![indexPath.item].tweetText
        }
        return tweetCell
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tabBarViewController = CustomTabBarController()
        self.present(tabBarViewController, animated: true, completion: nil)
    }
    
    func getTweetById(id: Int) {
        let service = Service(delegate: self)
        let headers = ["Content-Type":"application/json"]
        
        service.connectService(baseUrl: "http://localhost:3000/tweets?id=\(id)", method: .get, header: headers, body: nil)
    }
}
