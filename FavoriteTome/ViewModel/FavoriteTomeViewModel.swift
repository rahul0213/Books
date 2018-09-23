//
//  FavoriteTomeViewModel.swift
//  Books
//
//  Created by Rahul on 15/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit
import  AlamofireImage
protocol RequestCompleted
{
    func didFinishedRequestWithResponse(_ booksReceived:AllParseData)
}

class FavoriteTomeModelView
{
    
    private let downloader = ImageDownloader()
    var allTheBooks:AllParseData?
    var delegate:RequestCompleted?
    
    var selectedIndex : NSInteger?
    
    var startIndex:Int?
    {
        get
        {
            return self.startIndex ?? 0
        }
        set(newValue)
        {
            self.startIndex = newValue
        }
    }
    
    
let connectionSetup = Connection()
    
    
}

extension FavoriteTomeModelView
{
    
    func getAllBooks(withQuery query:String, fromIndex index:String)
    {
        let queryString = "\(query)&startIndex=\(index)"
        
      
        
        
        connectionSetup.getAllTheDataFromGoogleWithQuery(queryString) { (BookList, error) in
            if let bookListReceived = BookList
            {
                self.allTheBooks = bookListReceived

                if Thread.isMainThread
                {
                     self.delegate?.didFinishedRequestWithResponse(bookListReceived)
                } else
                {
                    DispatchQueue.main.sync
                        {
                          self.delegate?.didFinishedRequestWithResponse(bookListReceived)
                        }
                }


            }
        }
        
    
        
        
    }
    
    
    
}
