//
//  CreateReaderModel.swift
//  Books
//
//  Created by Rahul on 22/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
protocol UserCreationResult
{
    func userCreadtionResult(result:PossibleError?,success:Success?)
}

struct CreateReaderModel
{
    var reader:ReaderStruct?
      var delegate: UserCreationResult?
    
    init(readerName name:String, readerEmail email:String, readerAge age:String,readerPassword password:String)
    {
        self.reader = ReaderStruct(readerName: name, readerEmailID: email, readerAge: age, password: password)
    }

    
    func createReaderWithDetails()->(Success?,PossibleError?)
    {
        let reader = SaveAndFetch.createReader(self.reader!)
        
        guard let _ = reader.0 else
        {
            
            return(nil,reader.1)
        }
        
      return(reader.0,nil)
        
    
    }
    
    
}
