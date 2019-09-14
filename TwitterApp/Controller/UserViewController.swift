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
    
    func sendDataToUserController(delege: Int) {
        self.userId = delege
    }
    
    let userCellId = "userCellId"
    let headerCellId = "headerCellId"
    
    //User a ait tweet yok ise exception fırlatır.
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
    
    func getUserById(userId: Int) {
        let service = Service(delegate: self)
        let headers = ["Content-Type":"application/json"]
        service.connectService(baseUrl: "http://localhost:3000/users/\(userId)", method: .get, header: headers, body: nil)
    }
    
    func checkUserId(id: Int?) throws -> Bool {
        if id == nil {
            throw Check.Id(errmsg: "User'a ait tweet bulunamadı")
        }
        return true
    }
    
    var user : User? {
        didSet { collectionView?.reloadData()}
    }
    
    func successConnection(response: Data) {
        do{
            let responseModel = try JSONDecoder().decode(User.self, from: response)
            self.user = responseModel
        }catch{
            
        }
    }
    
    func errorConnection(message: String) {
        print("errorConnection: \(message)")
    }
    
    // Hide the status bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        
        //transition effect
        self.modalTransitionStyle = .crossDissolve
        
        collectionView?.delegate = self
        collectionView?.dataSource = self
      
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: userCellId)
        collectionView?.register( HeaderCell.self, forCellWithReuseIdentifier: headerCellId)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (section == 0) ? 1 : 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == 0 {
            let headerCell = collectionView.dequeueReusableCell(withReuseIdentifier: headerCellId, for: indexPath) as? HeaderCell
            
            return headerCell!
        }else{
            let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: userCellId, for: indexPath) as? UserCell
            
            let fullName: String
            
            if user?.firstName != nil && user?.lastName != nil {
                fullName = "\(String(describing: user!.firstName)) \(String(describing: user!.lastName))"
                userCell?.nameLabel.text = String(fullName)
            }
            if user?.age != nil{
                userCell?.bioTextView.text = "I am \(user!.age) years old"
            }
            userCell?.usernameLabel.text = user?.profile
            
            return userCell!
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 0 {
            return CGSize(width: view.frame.width , height: 50)
        }else {
            return CGSize(width: view.frame.width , height: view.frame.height/2)
        }
    }
}

// Custom Top Navigation Bar

extension UserViewController {
    private func setupNavBar() {
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        titleImageView.frame = CGRect(x: view.frame.width/2 - 17, y: 4, width: 34, height: 34)
        titleImageView.contentMode = .scaleAspectFit
        
        let navBar=UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        navBar.backgroundColor = .white
        
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "backward").withRenderingMode(.alwaysOriginal), for: .normal)
        followButton.frame = CGRect(x: 4, y: 4, width: 34, height: 34)
        followButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
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
    
    @objc func goBack() {
        let customTabBarController = CustomTabBarController()
        self.present(customTabBarController, animated: true, completion: nil)
    }
}
