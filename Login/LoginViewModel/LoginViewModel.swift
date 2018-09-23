//
//  LoginViewModel.swift
//  Books
//
//  Created by Rahul on 15/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
struct LoginViewModel
{
  
  
    private var loginModel = LoginModel()
    
    
    
    func loginWithDetails(_ userName:String?,_ password:String?) -> ReaderLoginResult
    {
        guard let name = userName else
        {
            _ = ShowAlert(alertType:.EnterEmailID)
            return .DoesNotExists
        }
        
        guard let password = password else
        {
            
            _ = ShowAlert(alertType:.EnterPassword)
            return .DoesNotExists
            
        }
        
       let readerExists = checkForReader(userName: name, password: password)
        
        if readerExists == .Success
        {
            return .Exists
        }
         return .DoesNotExists
    }
    
    func checkForReader(userName id:String,password pass:String) -> ReusultMethod
    {
        
        let readerFetched = SaveAndFetch.getReader(id)
        
        
   
        guard let readerExtst = readerFetched.0
            else
        {
             _ = ShowAlert(alertType:.ReaderDoesNotExists)
                return .Failure
                
        }
        
        
        loginModel.setReaderDetails(readerName:readerExtst.name!, readerEmailID:readerExtst.emailID!, readerAge: readerExtst.age!, readerPassword: readerExtst.password!)
        
        
        return .Success
        
        
    
    }
    
}
