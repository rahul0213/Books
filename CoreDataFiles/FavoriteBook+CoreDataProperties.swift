//
//  FavoriteBook+CoreDataProperties.swift
//  Books
//
//  Created by Rahul on 13/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension FavoriteBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteBook> {
        return NSFetchRequest<FavoriteBook>(entityName: "FavoriteBook")
    }

    @NSManaged public var author: String?
    @NSManaged public var bookDescription: String?
    @NSManaged public var link: String?
    @NSManaged public var name: String?
    @NSManaged public var publishDate: NSDate?
    @NSManaged public var rating: String?

}
