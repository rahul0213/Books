//
//  BookShelf.swift
//  Books
//
//  Created by Rahul on 23/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


struct ReaderBookShelf
{
    var name:String?
    var numberOfBooks:String?
    var genre:Genre?
    var owner:Reader?
    var bookLinks:String?
    
    init(name:String,totalBooks numberOfBooks:String,bookLink bookLinks:String,owner reader:Reader,genre type:Genre)
    {
        self.name = name
        self.numberOfBooks = numberOfBooks
        self.genre = type
        self.owner = reader
        self.bookLinks = bookLinks
    }
    
    
}
