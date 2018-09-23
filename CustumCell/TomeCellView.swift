//
//  TomeCellView.swift
//  Books
//
//  Created by Rahul on 16/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit

class TomeCellView: UITableViewCell
{
    
    @IBOutlet  var bookImageView: ImageViewSubclass?
    @IBOutlet var lblBookName: UILabel?
     @IBOutlet var lblDescription: UILabel?
    var bookDetails:FavoriteBookCustomCellModel?
    {
        didSet
        {
            if let name:String = bookDetails?.title
            {
                print(name)
                lblBookName?.text = name
            }
            else
            {
                lblBookName!.text = "No Title"
           }
           
            print("Label Book \((lblBookName!.text)!)")
            lblDescription?.text = bookDetails?.description
            if let image = bookDetails?.imageView.image
            {
                print("ImageReceivedNow")
                bookImageView?.image = image
            }
            
            
    }
    }

    override func awakeFromNib()
    {
        super.awakeFromNib()
  
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
