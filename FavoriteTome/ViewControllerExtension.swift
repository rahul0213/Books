//
//  ViewControllerExtension.swift
//  Books
//
//  Created by Rahul on 17/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit



extension FavoriteTomeViewController:UITableViewDelegate,UITableViewDataSource
{
    
    
    
      public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
     {
//        if indexPath.row == favTomeModelView.selectedIndex
//        {
//            return 271.0
//        }
//        else
//        {
//            return 271.0
//        }
        return 271.0
        
      }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
//        if indexPath.row == favTomeModelView.selectedIndex{
//            favTomeModelView.selectedIndex = -1
//        }else{
//            favTomeModelView.selectedIndex = indexPath.row
//        }
//
//
//      //  self.heightOfCellAfterExpending = self.calculateHeightForBookCell(favTomeModelView.allTheBooks!.items![indexPath.row])
//
//        tableView.beginUpdates()
//        tableView.endUpdates()
    }
    
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        guard let numberOfRows = allTheBookArray?.items?.count else
        {
            return 0
        }
        return numberOfRows
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier:"TomeCellView") as! TomeCellView
        
          print("All the data in Array\(NSDate())")
        
     let favBook = FavoriteBookCustomCellModel((allTheBookArray?.items![indexPath.row])!)
 
        cell.bookDetails = favBook
  
        return cell
        
    }
    
    func didFinishedRequestWithResponse(_ booksReceived: AllParseData)
    {
        allTheBookArray = booksReceived
        
        print("All the data in Array")
         print("\r⚡️: \(Thread.current)\r" + "🏭: \(OperationQueue.current?.underlyingQueue?.label ?? "None")\r")
        DispatchQueue.global().async(execute: {
            print("teste")
            DispatchQueue.main.sync{
                self.tblBooks?.reloadData()
            }
        })

 
       
        
       
        
        
        
 }
    
    @objc func showSecondViewController(_ sender:UITapGestureRecognizer )
    {
       
        if let cellView = sender.view!.superview!.superview! as? TomeCellView
        {
            let indexPath = tblBooks?.indexPath(for: cellView)
            
            let bookSelected = favTomeModelView.allTheBooks!.items![(indexPath?.row)!]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier:"SelectedViewController") as? SelectedViewController
            secondViewController?.selectedBook = bookSelected
            self.navigationController?.show(secondViewController!, sender: self)
    
        }
        
        
        
      
       
    }
    
  
    
}
