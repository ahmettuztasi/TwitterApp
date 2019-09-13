//
//  TwitterAppTests.swift
//  TwitterAppTests
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import XCTest

@testable import TwitterApp

class TwitterAppTests: XCTestCase {
    
    func testUserModel() {
        let user = User(id: 1, firstName: "String", lastName: "String", profile: "String")
        XCTAssertEqual(user.id, 1)
        XCTAssertEqual(user.firstName, "String")
        XCTAssertEqual(user.lastName, "String")
        XCTAssertEqual(user.profile, "String")
    }
    
    func testTweetModel() {
        let tweet = Tweet(id: 2, firstName: "String", lastName: "String", profile: "String", tweetText: "String")
        XCTAssertEqual(tweet.id, 2)
        XCTAssertEqual(tweet.firstName, "String")
        XCTAssertEqual(tweet.lastName, "String")
        XCTAssertEqual(tweet.profile, "String")
        XCTAssertEqual(tweet.tweetText, "String")
    }
    
    func testCustomTabBar(){
        
    }
    
    func testTweetViewController() {
        
    }
    
}
