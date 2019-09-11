//
//  HeaderCell.swift
//  TwitterApp
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import LBTAComponents

class HeaderCell: DatasourceCell {
    
    var backButton : UIButton = {
        let button = UIButton()
        
        button.backgroundColor = UIColor.red
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = .white
        
        addSubview(backButton)
        backButton.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 4, leftConstant: 2, bottomConstant: 4, rightConstant: 0, widthConstant: 50, heightConstant: 40)
    }
}
