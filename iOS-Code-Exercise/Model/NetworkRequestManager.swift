//
//  NetworkRequestManager.swift
//  iOS-Code-Exercise
//
//  Created by Bhushan Shinde on 31/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//

import Foundation
import UIKit
class NetworkRequestManager {
    
  let jsonFeedUrl = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    var feedRows : [row] = Array()
    func makeNetworkRequest(_ completion:@escaping ([row],String?)->()){
        //Check if given string can be converted to URL. Otherwise return
        guard let url = URL(string: jsonFeedUrl) else {return }
        let dataTask = URLSession.shared.dataTask(with:url){ (data,urlResponse, error) in
            // if no response return
            guard let response = data else{return}
            do {
               // Convert data to string so it can be parsed.
                let jsonString = NSString(data:response, encoding:String.Encoding.ascii.rawValue)
                
                // Get properly formatted data from string
                if let formattedData = jsonString?.data(using: String.Encoding.utf8.rawValue, allowLossyConversion:false){
                     let feed = try JSONDecoder().decode(FeedModel.self, from:formattedData)
                    //Add row to feedRows array
                    for row in feed.rows{
                      self.feedRows.append(row)
                    }
                    completion(self.feedRows,feed.title)
                    
                }else{
                    print("Error occured while converting string to data")
                    //completion(self.feedRows)
                }
            }catch let error{
                print("Error occured:",error.localizedDescription)
                //completion(self.feedRows)
            }
        }
        dataTask.resume()
    }
    
    func downloadImageFromURL(imageURL:String, completionHandler:@escaping (UIImage)->()){
        guard let url = URL(string: imageURL) else {return }
        let imageDataTask = URLSession.shared.dataTask(with:url){ (data,urlResponse, error) in
            // if no response return
            if error != nil{
                print("Error:",error?.localizedDescription)
            }else{
               guard let response = data else{return}
                if let image = UIImage(data:response){
                  completionHandler(image)
                }
            }
        }
        imageDataTask.resume()
      
 }
}
