//
//  CreateReaderViewModel.swift
//  Books
//
//  Created by Rahul on 22/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


struct CreateReaderViewModel
{
    
   
    func createReaderWithDetails(readerName name:String?, readerEmailID emailID:String?,readerAge age:String,readerPassword password:String)->(Success?,PossibleError?)
    {
        
        let createReaderModel = CreateReaderModel(readerName: name!
            , readerEmail: emailID!, readerAge: age, readerPassword: password)
        let createReaderResult = createReaderModel.createReaderWithDetails()
        
        if let readerCreated = createReaderResult.0
        {
           
            return(readerCreated,nil)
        }
        else
        {
          
            return(nil,PossibleError.ReaderAlreadyExists)
        }
        
        
    }
    
    
    
    
}
