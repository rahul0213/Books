//
//  StringExtension.swift
//  Books
//
//  Created by Rahul on 24/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation
import UIKit


extension String
{
    func height(withConstrainedWidth width:CGFloat, font:UIFont)->CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
           return ceil(boundingBox.height) 
    }
    
    
}

extension NSAttributedString
{
    func height(withConstrainedWidth width: CGFloat) -> CGFloat
    {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return ceil(boundingBox.height)
     }
}
