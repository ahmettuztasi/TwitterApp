//
//  TweetViewController.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class TweetViewController: DatasourceController, ConnectionDelegate {
    
    let tweetCellId = "tweetCellId"
    let headerCellId = "headerCellId"
    
    // Using for user id didselectitem, sending UserViewController
    var userId: Int?
    
    // Tweet List
    var tweet : [Tweet]? {
        didSet {
            collectionView?.reloadData()
            activityIndicator.stopAnimating()
        }
    }
    
    // Activity Indicator
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // Initilazation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Register viewCell to controller
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: tweetCellId)
        collectionView?.register(HeaderCell.self, forCellWithReuseIdentifier: headerCellId)
        
        activityIndicatorStarter()
        setupNavBar()
        getTweets()
    }
    
    // Success Connection to server
    func successConnection(response: Data) {
        do {
            self.tweet = try JSONDecoder().decode([Tweet].self, from: response)
            DispatchQueue.main.async{
                self.collectionView?.reloadData()
            }
        } catch { print(error)}
    }
    
    // Failure Connection to server
    func errorConnection(message: String) {
        print("Response \(message)")
        Toast(text: message, delay: 0, duration: 3).show()
    }

    // Get all tweets in server
    func getTweets() {
        let service = Service(delegate: self)
        let headers = ["Content-Type":"application/json"]
        service.connectService(baseUrl: "http://localhost:3000/tweets", method: .get, header: headers, body: nil)
    }
    
    // Activity Indicator starter
    func activityIndicatorStarter() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    // Get tweet's user image
    func getImage(url: URL?) -> UIImage {
        //profile image view
        let data = try? Data(contentsOf: url!)
        if(data == nil) {
            Toast(text: "Internete bağlı değilsiniz", delay: 0, duration: 2).show()
        } else {
            return UIImage(data: data!)!
        }
        return UIImage()
    }
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0) ? 1 : tweet?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as? HeaderCell
            
            return headerCell!
        }else{
            let tweetCell = collectionView.dequeueReusableCell(withReuseIdentifier: tweetCellId, for: indexPath) as! TweetCell
            if(self.tweet != nil){
                
                tweetCell.messageTextView.text = self.tweet![indexPath.item].tweetText
                
                tweetCell.fullNameTextView.text = String(self.tweet![indexPath.item].firstName + " " + self.tweet![indexPath.item].lastName)
                tweetCell.userNameTextView.text = String(self.tweet![indexPath.item].profile)
                
                let url = URL(string: (tweet![indexPath.item].profileImgUrl))
               
                tweetCell.profileImageView.image = getImage(url: url)
               
            }
            return tweetCell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width , height: 50)
        } else {
            return CGSize(width: view.frame.width , height: 150)
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //send data tweetView to userView
        let userViewController = UserViewController()
        let delege : SendingDataTweetVCtoUserVC?
        delege = userViewController
        delege?.sendDataToUserController(delege: (tweet?[indexPath.item].userId)!)
        
        self.present(userViewController, animated: true, completion: nil)
    }
}


// Custom Top Navigation Bar

extension TweetViewController {
    private func setupNavBar() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: view.frame.width/2 - 17, y: 4, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        let navBar=UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        navBar.backgroundColor = .white
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 4, y: 4, width: 34, height: 34)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search").withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: view.frame.width - 38 - 2 - 34, y: 4, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "compose").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: view.frame.width - 38, y: 4, width: 34, height: 34)
        
        self.view.addSubview(navBar)
        self.view.addSubview(titleImageView)
        self.view.addSubview(followButton)
        self.view.addSubview(searchButton)
        self.view.addSubview(composeButton)
    }
}
