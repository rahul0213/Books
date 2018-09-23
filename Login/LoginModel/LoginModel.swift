//
//  LoginModel.swift
//  Books
//
//  Created by Rahul on 17/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


struct LoginModel
{
  
    
     func setReaderDetails(readerName name:String,readerEmailID emailID:String,readerAge age:String,readerPassword password:String)
    {
        let readerDeatils = ReaderStruct(readerName: name, readerEmailID: emailID, readerAge:age, password: password)
        var globalData = AppData.shared
        globalData.ReaderNew = readerDeatils
        
        
    }
}
