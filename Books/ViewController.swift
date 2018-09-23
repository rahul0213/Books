//
//  ViewController.swift
//  Books
//
//  Created by Rahul on 12/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit


class ViewController: UIViewController,GIDSignInUIDelegate
{
    
   @IBOutlet weak var signInButton: GIDSignInButton!
    @IBOutlet weak var btnCreateAccount: UIButton?
    override func viewDidLoad()
    {
        super.viewDidLoad()
      GIDSignIn.sharedInstance().uiDelegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
   
}

