//
//  BookShelf+CoreDataProperties.swift
//  Books
//
//  Created by Rahul on 13/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//
//

import Foundation
import CoreData


extension BookShelf {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BookShelf> {
        return NSFetchRequest<BookShelf>(entityName: "BookShelf")
    }

    @NSManaged public var countOfBooks: String?
    @NSManaged public var genere: String?
    @NSManaged public var name: String?
    @NSManaged public var bookShelfs: NSSet?
    @NSManaged public var owner:Reader
    @NSManaged public var bookLinks:String?

}

// MARK: Generated accessors for bookShelfs
extension BookShelf {

    @objc(addBookShelfsObject:)
    @NSManaged public func addToBookShelfs(_ value: Reader)

    @objc(removeBookShelfsObject:)
    @NSManaged public func removeFromBookShelfs(_ value: Reader)

    @objc(addBookShelfs:)
    @NSManaged public func addToBookShelfs(_ values: NSSet)

    @objc(removeBookShelfs:)
    @NSManaged public func removeFromBookShelfs(_ values: NSSet)

}
