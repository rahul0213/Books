//
//  Reader.swift
//  Books
//
//  Created by Rahul on 17/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import CoreData

struct ReaderStruct
{
    let name:String?
    let emailID:String?
    let age:String?
    let password:String?
    
    init(readerName name:String?, readerEmailID emailID:String?, readerAge age:String?, password pass:String?)
    {
        self.name = name
        self.emailID  = emailID
        self.age = age
        self.password = pass
        
    }
    
}
