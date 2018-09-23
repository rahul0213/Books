//
//  UIImageViewExtesnion.swift
//  Books
//
//  Created by Rahul on 18/09/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

class ImageViewSubclass: UIImageView
{
    var imageURLString:String?
    
    func loadImagesUsinURLString(urlString:String)
    {
        imageURLString = urlString
        DispatchQueue.global(qos:.userInitiated).async
            {
    
                if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage
                {
                    DispatchQueue.main.async
                        {
                            self.image = imageFromCache
                        }
                    return
                }
                let networkConnection = Connection()
                networkConnection.downloadImageUsingURL(urlString)
                { (image, response, error) in
                    
                    if let errorOccured = error
                    {
                        print("Error Occured In Image \(errorOccured)")
                       
                        self.loadImagesUsinURLString(urlString: urlString)
                        return
                    }
            
            
            DispatchQueue.main.async
                 {
                    if self.imageURLString == urlString
                    {
                        print("Image Received\(image!)")
                           self.image = image
                    }
                    
                   
                    imageCache.setObject(image!, forKey: urlString as AnyObject)
                  
                    
                    
                 }
            
        }
        
        }
    }
    
}
