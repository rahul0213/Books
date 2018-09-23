//
//  BooksUITests.swift
//  BooksUITests
//
//  Created by Rahul on 12/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import XCTest

class BooksUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        XCUIDevice.shared.orientation = .portrait
                // Use recording to get started writing UI tests.
        
        let app = XCUIApplication()
        app.buttons["Log In"].tap()
        app/*@START_MENU_TOKEN@*/.segmentedControls.buttons["Titles"]/*[[".segmentedControls.buttons[\"Titles\"]",".buttons[\"Titles\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
                        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
