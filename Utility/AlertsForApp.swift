//
//  AlertsForApp.swift
//  Books
//
//  Created by Rahul on 18/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit


struct ShowAlert
{
    var alerErrorType:PossibleError?
    var alertSuccess:Success?
    
    
    init(alertType error:PossibleError)
    {
        self.alerErrorType = error
        alertSuccess = nil
        showAlertWithError()
    }
    
    init(alertType showSuccess:Success)
    {
      self.alertSuccess = showSuccess
        alerErrorType = nil
        showAlertWithSuccess()
        
    }
    
    
    func showAlertWithSuccess()
    {
        var message:String
        
        switch alertSuccess
        {
        case .UserCreated?:
            message = "You are now a Reader"
            break
        
        default:
            message = "Uknown Error, try Again"
        }
        
        
        let alert = UIAlertController(title:"Congratulations", message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            let presentedViewController = topController.presentedViewController
            topController = presentedViewController!
            topController.present(alert, animated: true)
            {
                let delayInSeconds = 3.0
                DispatchQueue.main.asyncAfter(deadline: .now() + delayInSeconds)
                {
        
                topController.dismiss(animated: true, completion: nil)
                    
                }
                
            }
            
            
        }
        
        
        
    }
    
    
    
    func showAlertWithError()
    
    {
        var message:String?
        
        switch alerErrorType
        {
        case .ReaderAlreadyExists?:
            message = "Email ID already exits try again"
            break
        case .BookShelfAlreadyExists?:
            message = "BookShelf with same name already exits"
        
        case .InvalidEmailID?:
            message = "Please Enter valid email ID"
            
        
        case .AuthenticationError?:
            message = "Authentication Error, Please try again"
        case .BadRequest?:
            message = "Bad Request , Please try again"
        case .Outdated?:
            message = "Uknown Error, try Again"
        case .NoInternetConnection?:
            message = "Network Error, Please check your internet connection and try again"
        default:
            message = "Uknown Error, try Again"
        }
        
        
        let alert = UIAlertController(title:"Sorry Error Occured", message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
             let presentedViewController = topController.presentedViewController
                topController = presentedViewController!
                topController.present(alert, animated: true) {
                    print("complete")
                
            }
            
            // topController should now be your topmost view controller
        }
        
        

    }
    
    
    
    
}
