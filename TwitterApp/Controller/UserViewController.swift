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

class UserViewController: DatasourceController, ConnectionDelegate, SendingDataTweetVCtoUserVC {
    
    
    let userCellId = "userCellId"
    let headerCellId = "headerCellId"
    
    // User model
    var user : User? {
        didSet {
            collectionView?.reloadData()
            activityIndicator.stopAnimating()
        }
    }
    
    // if not exist userId, throws exception
    var userId: Int? {
        didSet {
            do{
                if (try checkUserId(id: userId)) {
                    getUserById(userId: userId!)
                }
            }
            catch Check.Id(let err) {
                Toast(text: err, delay: 0, duration: 1).show()
                let appearence = ToastView.appearance()
                appearence.backgroundColor = UIColor.blue
                appearence.textColor = UIColor.white
                appearence.font = UIFont.boldSystemFont(ofSize: 20)
                appearence.cornerRadius = 14
            } catch {
                
            }
        }
    }
    
    // Actity Indicator
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // Initilazation
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register viewCell to controller
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: userCellId)
        collectionView?.register( HeaderCell.self, forCellWithReuseIdentifier: headerCellId)
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        // Activity Indicator
        activityIndicatorStarter()
        activityIndicator.startAnimating()
        
        //transition effect
        self.modalTransitionStyle = .crossDissolve
        
        setupNavBar()
    }
    
    // Delegetion from TweetViewController
    func sendDataToUserController(delege: Int) {
        self.userId = delege
    }

    // Get user by userId
    func getUserById(userId: Int) {
        let service = Service(delegate: self)
        let headers = ["Content-Type":"application/json"]
        service.connectService(baseUrl: "http://localhost:3000/users/\(userId)", method: .get, header: headers, body: nil)
    }
    
    // Check user by userId
    func checkUserId(id: Int?) throws -> Bool {
        if id == nil {
            throw Check.Id(errmsg: "User'a ait tweet bulunamadı")
        }
        return true
    }
    
    // Success Connection to server
    func successConnection(response: Data) {
        do{
            let responseModel = try JSONDecoder().decode(User.self, from: response)
            self.user = responseModel
        } catch { print(error)}
    }
    
    // Failure Connection to server
    func errorConnection(message: String) {
        print("errorConnection: \(message)")
        Toast(text: message, delay: 0, duration: 3).show()
    }
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // Activity Indicator
    func activityIndicatorStarter() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellId, for: indexPath) as? UserCell
        
        let fullName: String
        
        if user?.firstName != nil && user?.lastName != nil {
            fullName = "\(String(describing: user!.firstName)) \(String(describing: user!.lastName))"
            userCell?.nameLabel.text = String(fullName)
        }
        if user?.age != nil{
            userCell?.bioTextView.text = "I am \(user!.age) years old"
        }
        if user?.profile != nil {
            userCell?.usernameLabel.text = user?.profile
        }
        if user?.profileImgUrl != nil {
            let url = URL(string: (user?.profileImgUrl)!)
            let data = try? Data(contentsOf: url!)
            if(data == nil) {
                Toast(text: "Internete bağlı değilsiniz", delay: 0, duration: 3).show()
            } else {
                userCell?.profileImageView.image = UIImage(data: data!)
            }
            
        }
        return userCell!
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width , height: view.frame.height/2)
    }
}

// Custom Top Navigation Bar

extension UserViewController {
    private func setupNavBar() {
        
        let navBar=UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        navBar.backgroundColor = .clear
        
        let backButton = UIButton(type: .system)
        backButton.setImage(#imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.frame = CGRect(x: 8, y: 8, width: 25, height: 25)
        backButton.addTarget(self, action: #selector(goBack), for: .touchDown)
        
        //for ui test
        backButton.isAccessibilityElement = true
        backButton.accessibilityIdentifier = "backButton"
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(#imageLiteral(resourceName: "more").withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: view.frame.width - 38, y: 8, width: 34, height: 25)
        
        self.view.addSubview(navBar)
        self.view.addSubview(backButton)
        self.view.addSubview(composeButton)
    }
    
    @objc func goBack() {
        let customTabBarController = CustomTabBarController()
        self.present(customTabBarController, animated: true, completion: nil)
    }
}
