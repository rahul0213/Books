//
//  HTTPClientTests.swift
//  BooksTests
//
//  Created by Rahul on 21/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import XCTest

@testable import Books

class HTTPClientTests: XCTestCase
{
    var subject:HttpClient!
    let session = MockURLSession()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    subject = HttpClient(session: session)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_GET_RequestTheURL()
    {
        let url = NSURL(string:"http://masilotti.com")
        subject.get(url:url!)
        { (_, _) -> Void in
            
        }
    }
    func test_GET_StartsTheRequest() {
        let dataTask = MockURLSessionDataTask()
        session.nextDataTask = dataTask
        
        subject.get(url: NSURL()) { (_, _) -> Void in }
        
        XCTAssert(dataTask.resumeWasCalled)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
