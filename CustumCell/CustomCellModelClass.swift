//
//  CustomCellModelClass.swift
//  Books
//
//  Created by Rahul on 18/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit

struct FavoriteBookCustomCellModel
{
    let description:String
    let imageView = UIImageView()
    let title:String
    
    init(_ bookDetails:BookParse)
    {
        title = (bookDetails.volumeInfo?.title)!
        description = (bookDetails.volumeInfo?.description)!
     // imageView.loadImagesUsinURLString(urlString:(bookDetails.volumeInfo?.imageLinks!["smallThumbnail"])!)

    }
    
}
