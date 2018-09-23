//
//  FavoriteTomeViewController.swift
//  Books
//
//  Created by Rahul on 17/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit




class FavoriteTomeViewController: UIViewController,RequestCompleted {
    
 
    @IBOutlet weak var tblBooks:UITableView?
    let favTomeModelView = FavoriteTomeModelView()
    private let refreshControl = UIRefreshControl()
    var allTheBookArray:AllParseData?
  
    
    var constantLabelSize:CGFloat
    {
        return 122.0
    }
    var normalCellSize:CGFloat
    {
        return 251.0
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        favTomeModelView.delegate = self
        if #available(iOS 10.0, *) {
            tblBooks?.refreshControl = refreshControl
        } else {
            tblBooks?.addSubview(refreshControl)
        }

        refreshControl.addTarget(self, action: #selector(getAllBooks), for: .valueChanged)
         getAllBooks()
        
    }

    override func viewWillAppear(_ animated: Bool)
    {
        
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    


    @objc func getAllBooks()
    {
        
        favTomeModelView.getAllBooks(withQuery: "Health", fromIndex: "0")
        
    }
    @IBAction func returnFromSegueActions(sender: UIStoryboardSegue)
    {
        
    }

}
