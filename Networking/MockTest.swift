//
//  MockTest.swift
//  Books
//
//  Created by Rahul on 20/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
typealias DataTaskResult = (NSData?, URLResponse?, NSError?) -> Void

typealias HTTPResult = (NSData?, Error?) -> Void
protocol URLSessionProtocol
{
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
        -> URLSessionDataTaskProtocol
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {
    
    
}

extension URLSession: URLSessionProtocol {
    func dataTaskWithURL(url: NSURL, completionHandler: (NSData?, URLResponse?, NSError?) -> Void) -> URLSessionDataTaskProtocol {
        return (dataTaskWithURL(url: url, completionHandler: completionHandler)
            as! URLSessionDataTask) as URLSessionDataTaskProtocol
    }
}

class HttpClient
{
     private let session: URLSessionProtocol
   
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    func get(url: NSURL, completion: HTTPResult)
    {
        session.dataTaskWithURL(url: url) { (_, _, _) -> Void in }
    }
    
    
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: NSURL?
    var nextDataTask = MockURLSessionDataTask()
    func dataTaskWithURL(url: NSURL, completionHandler: DataTaskResult)
        -> URLSessionDataTaskProtocol
    {
        lastURL = url
        return nextDataTask
    }
}
