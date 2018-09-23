//
//  Connection.swift
//  Books
//
//  Created by Rahul on 29/08/18.
//  Copyright © 2018 Rahul. All rights reserved.
//

import UIKit


 let GoogleBaseURLForQueryNotAuthenticated = "https://www.googleapis.com/books/v1/volumes?q="

enum DataParsingErrors:Error
{
    case DataNotAvailable(String)
    case DataNotParsable(String)
    case Unknown(String)
}



class Connection
{

    private let defaultSession = URLSession(configuration: .default)
    private var dataTask:URLSessionDataTask?
  
  
    enum Result<String>
    {
        case success
        case failure(String)
    }
   
    // MARK: Network Response
    
    enum NetworkResponse:String
    {
        case success
        case authenticationError = "You need to be authenticated"
        case badRequest = "Bad Request"
        case outdated = "The url you requested is outdated"
        case failed = "Network request failed"
        case noData = "Response returned with no data to decode"
        case unableToDecode = "We could not decode"
    }
    
    func downloadImageUsingURL(_ urlString:String, completion:@escaping(_ imageCompleted:UIImage?,_ error:NetworkResponse?,_ errorDescription:Error?)->())
    {
       let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { (data, respone, error) in
            
            if let errorReceived = error
            {
                print("Error Occured In Downloading Image")
                completion(nil,.failed,errorReceived)
            }
            else
            {
                let dataToImage = UIImage(data: data!)
                
                guard let dataToSend = dataToImage
                    else{
                        
                       completion(nil,.failed,nil)
                        return
                        
                }
                
                completion(dataToSend,nil,nil)
            }
            
        }.resume()
    }
   
    

    func getAllTheDataFromGoogleWithQuery(_ query:String,  completion: @escaping  (_ bookList:AllParseData?,_ error:Error?) ->())
    {
        
        dataTask?.cancel()
        print(query)
        
        if var urlComponents = URLComponents(string: GoogleBaseURLForQueryNotAuthenticated)
        {
             let urlBuild = GoogleBaseURLForQueryNotAuthenticated + query
            
            guard let url = URL(string:urlBuild) else
            {
                return
            }
            
            
            
            
            print("URL Request \(url)")
            dataTask = defaultSession.dataTask(with: url)
            {  (data, response, error)  in
  
                defer
                {
                    self.dataTask = nil
                }
                
                if let errorEncountered = error as NSError?
                {
                
                    print(errorEncountered.code)
                    if errorEncountered.code == -1009
                    {
                        _ = ShowAlert(alertType:.NoInternetConnection )
                    }
                    else
                    {
                        let result =   self.handleNetwokResponse((response as? HTTPURLResponse)!)
                        switch result
                        {
                        case .success:
                            print("All Books retrived")
                            
                        case .failure(_):
                            _ = ShowAlert(alertType: .Outdated)
                            
                        }
                    }
              }
                else if let data = data,let response = response as? HTTPURLResponse, response.statusCode == 200
                {
                    print(response.statusCode)
                    let bookParsed =  self.parseDataWithData(data)
                    guard let bookDetails = bookParsed.0 else
                    {
                        DispatchQueue.main.async {
                           _ = ShowAlert(alertType:.Unexpected )
                        }
                        
                        
                        
                        return
                    }
                 
                       completion(bookDetails,nil)
                    
                   
                    
                    
 
                }

            }
            
            dataTask?.resume()
        }
        
    }
 
    
    private func parseDataWithData(_ data:Data) -> (AllParseData?,String?)
    {
        do
        {
            let dataReceived = try JSONDecoder().decode(AllParseData.self, from: data)
            print(dataReceived)
            return (dataReceived,nil)
          
            
        }
        catch let error
        {
            print("Unknown Error \(error)")
            return (nil,"Please Try Again")
        }
    }
    
    
    fileprivate func handleNetwokResponse(_ response:HTTPURLResponse) -> Result<String>
    {
        switch response.statusCode
        {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return  .failure(NetworkResponse.outdated.rawValue)
            
        default: return .failure(NetworkResponse.failed.rawValue)
            
        }
    }
    
    
}




