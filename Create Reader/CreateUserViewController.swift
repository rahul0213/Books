//
//  CreateUserViewController.swift
//  Books
//
//  Created by Rahul on 19/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {

    @IBOutlet weak var btnCreateUser: UIButton!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmailID: UITextField!
    @IBOutlet weak var txtAge: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    

    @IBAction func btnCreateUser(_ sender: Any)
    {
        
           guard let name = txtName.text else
            {
                _ = ShowAlert(alertType:.EnterName)
                return
            }
        
        guard let age = txtAge.text else {
        
          _ = ShowAlert(alertType:.EnterAge)
            return
            
        }
        
        guard let emailID = txtEmailID.text else {
            
          _ =  ShowAlert(alertType:.EnterEmailID)
            return
        }
        
        guard let password = txtPassword.text else {
            
            _ =  ShowAlert(alertType:.EnterPassword)
            return
        }
        
        
       
    let createReaderViewModel = CreateReaderViewModel()
        
     let result = createReaderViewModel.createReaderWithDetails(readerName:name , readerEmailID: emailID, readerAge: age, readerPassword: password)
        
        if let readerSuccessful = result.0
        {
             _ = ShowAlert(alertType:readerSuccessful)
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            _ = ShowAlert(alertType:.ReaderAlreadyExists)
        }
        
    
    }
    

}
