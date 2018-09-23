//
//  SelectedBookStructure.swift
//  Books
//
//  Created by Rahul on 28/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation


struct SelectedBook
{
    
    var selectedBookId:String?
    var publisher:String?
    var publishedDate:String?
    var pageCount:Int?
    var printedPageCount:Int?
    var maturityRating:String?
    var imageLinks:Dictionary<String,Any>?
    var previewLink:String?
    var googlePlayLink:String?
    var saleInfo:Dictionary<String,Any>?
    var buyLink:String?
    var offers:[Any]?
    var accessInfo:Dictionary<String,Any>?
 var book:BookParse?
    
    init(_ selectedBookIDin:String?, _ seletedBookPublisher:String?,_ selectedBookPublishDate:String?,_ selectedBookPageCount:Int?, _ selectedBookPrintedPageCount:Int?,_ selectedBookMaturityRating:String?, _ selecetdBookImageLinks:Dictionary<String,Any>?,_ selectedBookPreviewLink:String?,_ selectedBookGooglePlayLink:String?,_ selecetdBookSaleInfo:Dictionary<String,Any>?,_ selecteBookBuyLink:String?, _ selectedBookOffers:[Any]?,_ selectedBook:BookParse?,
         _ selectedBookAccessInfo:Dictionary<String,Any>?)
    {
        
        self.selectedBookId = selectedBookIDin
        self.publisher = seletedBookPublisher
        self.publishedDate = selectedBookPublishDate
        self.pageCount = selectedBookPageCount
        self.printedPageCount  = selectedBookPrintedPageCount
        self.maturityRating = selectedBookMaturityRating
        self.imageLinks = selecetdBookImageLinks
        self.previewLink = selectedBookPreviewLink
        self.googlePlayLink = selectedBookGooglePlayLink
        self.saleInfo = selecetdBookSaleInfo
        self.buyLink = selecteBookBuyLink
        self.offers = selectedBookOffers
        self.accessInfo = selectedBookAccessInfo
        self.book = selectedBook
        
       
        
    }
    
    

}
