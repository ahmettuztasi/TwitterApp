//
//  TweetCell.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {
    
    var messageTextView: UITextView = {
        let tv = UITextView()
        tv.text = ""
        tv.backgroundColor = .clear
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.isEditable = false
        tv.sizeToFit()
        tv.translatesAutoresizingMaskIntoConstraints = true
        return tv
    }()
    
    var fullNameTextView: UITextView = {
        let fullName = UITextView()
        fullName.text = ""
        fullName.backgroundColor = .clear
        fullName.font = UIFont.boldSystemFont(ofSize: 18)
        fullName.isEditable = false
        fullName.sizeToFit()
        fullName.translatesAutoresizingMaskIntoConstraints = true
        return fullName
    }()
    
    var userNameTextView: UITextView = {
        let userName = UITextView()
        userName.text = ""
        userName.backgroundColor = .clear
        userName.textColor = UIColor.gray
        userName.font = UIFont.systemFont(ofSize: 14)
        userName.isEditable = false
        userName.sizeToFit()
        userName.translatesAutoresizingMaskIntoConstraints = true
        return userName
    }()
    
    var profileImageView: CachedImageView = {
        let imageView = CachedImageView()
        imageView.image = #imageLiteral(resourceName: "boy")
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "reply").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet-arrows-symbol").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "heart").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    var directMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "paper-plane").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        addSubview(fullNameTextView)
        addSubview(messageTextView)
        addSubview(userNameTextView)
        
        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        fullNameTextView.anchor(self.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 170, heightConstant: 30)
        
        messageTextView.anchor(fullNameTextView.bottomAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 4, bottomConstant: 30, rightConstant: 0, widthConstant: frame.width, heightConstant: frame.height)
        
        userNameTextView.anchor(self.topAnchor, left: fullNameTextView.rightAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 0, bottomConstant: 30, rightConstant: 0, widthConstant: 150, heightConstant: 27)
        
        setupBottomButtons()
    }
    
    fileprivate func setupBottomButtons() {
        let replyButtonContainerView = UIView()
        
        let retweetButtonContainerView = UIView()
        
        let likeButtonContainerView = UIView()
        
        let directMessageButtonContainerView = UIView()
        
        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, directMessageButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        
        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(directMessageButton)
        
        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        
        directMessageButton.anchor(directMessageButtonContainerView.topAnchor, left: directMessageButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
