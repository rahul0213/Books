//
//  SelectedViewController.swift
//  Books
//
//  Created by Rahul on 27/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit
import  AlamofireImage


class SelectedViewController: UIViewController,UIScrollViewDelegate {

    
    var selectedBook:BookParse?
    
    @IBOutlet weak var bookImage:UIImageView?
    @IBOutlet weak var txtView:UITextView?
    @IBOutlet weak var lblBookName:UILabel?
    @IBOutlet weak var scrllView:UIScrollView?
    @IBOutlet weak var lblAuthorName:UILabel?
    
    var bookDetails:SelectedBook?
    
      @IBOutlet weak var cosmosView: CosmosView!
    let downloader = ImageDownloader()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(true)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    public func scrollViewDidScroll(_ scrollView: UIScrollView)
//    {
//         scrollView.contentOffset.x = 0
//    }
//
    func getSetting(_ selectedBook:SelectedBook)
    {
     
        if let imageLink = selectedBook.imageLinks!["large"] as? String
        {
             //   bookImage?.downLoadImageAndSetImage(imageLink)
         }
        else
        {
            print("No Link available")
        }
        
        0
        bookDetails = selectedBook
        
       

    }
    
    @IBAction func openGooglePlayLink(_sender : AnyObject){
        
        let googleLink = bookDetails?.googlePlayLink
        
        UIApplication.shared.open(URL(string: googleLink!)!, options: [:], completionHandler: { (status) in
            
        })
        
        
    }
    
    
    

    
    
    

    
   

}
