//
//  TwitterAppUITests.swift
//  TwitterAppUITests
//
//  Created by Ahmet Tuztașı on 05/09/2019.
//  Copyright © 2019 Ahmet Tuztașı. All rights reserved.
//

import XCTest

class TwitterAppUITests: XCTestCase {
        var app: XCUIApplication!
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchArguments.append("--uitesting")
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testGoingThroughOnboarding() {
        app.launch()
        
        // Make sure we're displaying onboarding
        //XCTAssertTrue(true)
        
        // Swipe left three times to go through the pages
        app.swipeUp()
        let profileImg = XCUIApplication().images["profileImageView"].firstMatch
        profileImg.tap()
        
        
        // Tap the "Back" button
        app.buttons["backButton"].tap()
        app.swipeUp()
        
        
        // Onboarding should no longer be displayed
        //XCTAssertFalse(true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
