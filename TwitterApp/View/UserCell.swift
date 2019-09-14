//
//  UserCell.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell{
    
    let filterPp: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 38
        view.layer.masksToBounds = false
        view.layer.zPosition = -1;
        return view
    }()
    
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = #imageLiteral(resourceName: "boy")
        imageView.layer.cornerRadius = 35
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .clear
        return label
    }()
    
    var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.backgroundColor = .clear
        return label
    }()
    
    var bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = ""
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1).cgColor
        return button
    }()
    
    let coverImg: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "cover")
        image.layer.zPosition = -2;
        return image
        
    }()
    
    override func setupViews() {
        super.setupViews()
       
        backgroundColor = .white
        
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(coverImg)
        addSubview(filterPp)
        
        profileImageView.anchor(coverImg.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: -35, leftConstant: 25, bottomConstant: 0, rightConstant: 0, widthConstant: 70, heightConstant: 70)
        
        nameLabel.anchor(profileImageView.bottomAnchor, left: profileImageView.leftAnchor, bottom: nil, right: nil, topConstant: 2, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 150, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 3, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(usernameLabel.bottomAnchor, left: usernameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(coverImg.bottomAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant: 10, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 90, heightConstant: 30)
        
        coverImg.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width, heightConstant: 150)
        
        filterPp.anchor(coverImg.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: -38, leftConstant: 22, bottomConstant: 0, rightConstant: 0, widthConstant: 76, heightConstant: 76)
    }
}

