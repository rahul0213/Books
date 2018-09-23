//
//  SaveAndFetch.swift
//  Books
//
//  Created by Rahul on 11/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import CoreData



class SaveAndFetch: NSObject
{
    
    

    
    static func getReader(_ checkLoginDetailIDs:String?) -> (Reader?,PossibleError?)
    {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return(nil,.Unexpected)
        }
        
       guard let emailID = checkLoginDetailIDs else
       {
        return(nil,.InvalidEmailID)
       }
            let readerDetails = NSFetchRequest<NSFetchRequestResult>(entityName: "Reader")
            readerDetails.predicate = NSPredicate(format:"emailID = %@", emailID)
            
            let managerContext = appDelegate.persistentContainer.viewContext
            let readers = try! managerContext.fetch(readerDetails)
        
            
            if readers.count > 0
            {
                guard let readerDetails = readers[0] as? Reader
                    else
                {
                    
                    
                    return(nil,.Unexpected)
                }
                
                if readerDetails.emailID == emailID
                {
                    
                    return (readerDetails,nil)
                }
                
                
            }
        

            return (nil,.ReaderDoesNotExists)
 
    }
    
    static func fetchAllReaders()
    {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Reader")
        
        let sortDescriptor = NSSortDescriptor(key: "emailID", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        do
        {
            let managerContext = appDelegate.persistentContainer.viewContext
            let readers = try! managerContext.fetch(fetchRequest)
            
            
            print(readers)
            
        }
        
        
        
    }
    
    
    static func createReader(_ detailsOfReader:ReaderStruct) -> (Success?,PossibleError?)
    {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return (nil,.Unexpected)
        }
        
         let reader = Reader(context: appDelegate.persistentContainer.viewContext)
        
       func checkForReaderWithSameEmailID()->Bool
        {
            let readerFetch = NSFetchRequest<NSFetchRequestResult>(entityName:"Reader")
            readerFetch.predicate = NSPredicate(format: "emailID = %@", detailsOfReader.emailID!)
           // readerFetch.predicate = NSPredicate(format: "name = %@", detailsOfReader.name!)
            
            let manageContext = appDelegate.persistentContainer.viewContext
            
            let readers = try! manageContext.fetch(readerFetch)
            

            if readers.count>0
            {
            

                
                guard let readerName = readers[0] as? Reader
                else
                {
                    return false
                }
                if readerName.emailID == detailsOfReader.emailID
                {
                    return true
                }
                
            }
   
            
            return false
            
        }
        
        
        let checkIfUserExists = checkForReaderWithSameEmailID()
        
        
        if !checkIfUserExists
        {
            reader.age = detailsOfReader.age
            reader.emailID = detailsOfReader.emailID
            reader.name = detailsOfReader.name
            reader.password = detailsOfReader.password
            
            do
            {
            try appDelegate.persistentContainer.viewContext.save()
                
                 return (.UserCreated,nil)
            }
            catch
            {
                print("Error occured")
               return (nil,.Unexpected)
            }
        }
        else
        {
            return (nil,.ReaderAlreadyExists)
        }
        
        return (nil,.Unexpected)
        
        
    }
    
   static func createBookShelf(_ detailsOfBookShelf:ReaderBookShelf, _ reader:Reader)
    {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else
        {
                return
        }
        
        
        
        
        let bookShelf = BookShelf(context: appDelegate.persistentContainer.viewContext)
        
        
        
        func checkForBookWithSameName() -> Bool
        {
            let bookShelfFetch = NSFetchRequest<NSFetchRequestResult>(entityName:"BookShelf")
            
            guard let bookName = detailsOfBookShelf.name else {
                return false
            }
            
            bookShelfFetch.predicate = NSPredicate(format: "name = %@", bookName)
            
           let managedContext = appDelegate.persistentContainer.viewContext
            
            let users = try! managedContext.fetch(bookShelfFetch)
            let bookShelfName = users[0] as! BookShelf
            
            
            if bookShelfName.name == detailsOfBookShelf.name
            {
                return true
            }
            return false

        }
        
       let isAlreadayCreated =  checkForBookWithSameName()
        
        guard let bookShelfOwner = detailsOfBookShelf.name else {
            return
        }
        
        
        if !isAlreadayCreated
        {
            bookShelf.name = detailsOfBookShelf.name
            bookShelf.owner = detailsOfBookShelf.owner!
        }
      
        try! appDelegate.persistentContainer.viewContext.save()
        

        
    }
    
    
    
    
}
