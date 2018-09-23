//
//  BookStruct.swift
//  Books
//
//  Created by Rahul on 19/06/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import Foundation



struct AllParseData:Codable
{
    let items:[BookParse]?
}

struct BookParse:Codable
{
    let id:String?
    let selfLink:String?
    let volumeInfo:VolumeInformation?
}


public struct VolumeInformation:Codable
{
 
    let title:String?
    var authors:Array<String>?
    var description:String?
    var language:String?
    var imageLinks:Dictionary<String,String>?
  
 
    var id:String?
    
    enum CodingKeys:String,CodingKey
    {
        case kind = "kind"
        case totalItems = "totalItems"
        case item = "items"
        case id = "id"
        case selfLink = "selfLink"
        case volumeInfo = "volumeInfo"
        case title = "title"
        case authors = "authors"
        case publishedDate = "publishedDate"
        case description = "description"
        case maturityRating = "maturityRating"
        case imageLinks = "imageLinks"
        case smallThumbnail = "smallThumbnail"
        case previewLink = "previewLink"
        case thumbnail = "thumbnail"
        case language = "language"
    }
    
    public init(from decoder:Decoder)throws
    {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        print(title!)
        do
        {
        description = try container.decode(String.self, forKey: .description)
        }
        catch
        {
            description = "No Desscription Available"
        }
        imageLinks = try container.decode(Dictionary.self, forKey: .imageLinks)
        do
        {
        authors = try container.decode(Array.self, forKey: .authors)
        }
        catch
        {
            authors = nil
        }
        language = try container.decode(String.self, forKey: .language)
    }
    
    public func encode(to encoder: Encoder) throws
    {
        
    }
    
}


