//
//  LoginViewController.swift
//  Books
//
//  Created by Rahul on 23/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    private var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnCancel(_ sender: Any)
    {
        self.dismiss(animated: true)
        {

        }
        
    }
    
     @IBAction func checkForLogin(_ sender: Any)
    {
        
        
     let checkIfUserExists =  viewModel.loginWithDetails(txtEmail.text, txtPassword.text)
        
        if checkIfUserExists == .Exists
        {
            let VC:FavoriteTomeViewController = storyboard?.instantiateViewController(withIdentifier: "FavoriteTomeViewController") as! FavoriteTomeViewController
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        
        
    }
    
   


}
