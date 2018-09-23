//
//  Reader+CoreDataProperties.swift
//  Books
//
//  Created by Rahul on 13/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension Reader {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Reader> {
        return NSFetchRequest<Reader>(entityName: "Reader")
    }

    @NSManaged public var age: String?
    @NSManaged public var emailID: String?
    @NSManaged public var name: String?
    @NSManaged public var owner: BookShelf?
    @NSManaged public var password:String?
    
//    func makeIterator() -> Reader.Iterator {
//        
//    }

}
