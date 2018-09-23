//
//  GlobalData.swift
//  Books
//
//  Created by Rahul on 03/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


struct AppData
{
   // let Reader = ReaderStruct(readerName: "defaultName", readerEmailID: "defaultID", readerAge: "defaultAge", password: "defaultPassword")
    
    var ReaderNew:ReaderStruct?
    
    static  let shared = AppData()
    
    private init()
    {
        
    }
}

enum ReusultMethod
{
    case Success
    case Failure
}

enum ReaderLoginResult
{
    case Exists
    case DoesNotExists
}

