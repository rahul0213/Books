//
//  SearchExtension.swift
//  Books
//
//  Created by Rahul on 08/07/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit

extension FavoriteTomeViewController:UISearchBarDelegate
{
    
    func updateSearchResultWithQuery(_ query:String?)
    {
       // print(<#T##items: Any...##Any#>)
       
    }
    
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        let bookToSearch = searchBar.text as! String
        searchBar.text = nil
        self.view.endEditing(true)
        
//        let queryString = "\(bookToSearch)&startIndex=\(startIndex)"
//        
//        updateSearchResultWithQuery(queryString)
        
        
    }
    
    
}
    
