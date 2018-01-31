//
//  ViewModel.swift
//  iOS-Code-Exercise
//
//  Created by Bhushan Shinde on 31/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//

import Foundation
import UIKit
class ViewModel {
    
    var feedRows : [row] = Array()
    func requestDataFromNetworkManager(_ completion:@escaping ([row],String?)->()) {
        let networkRequest = NetworkRequestManager()
        networkRequest.makeNetworkRequest { (feedRows,title) in
            
            //Get data from model. Perform some validation. Format it and pass back to view.
            
            let navBarTitle = title ?? ""
            if feedRows.count > 0 {
                for var row in feedRows {
                    
                    if row.title == nil {
                        row.title = ""
                    }
                    if row.description == nil {
                        row.description = ""
                    }
                    if row.imageHref == nil {
                        row.imageHref = ""
                    }
                    self.feedRows.append(row)
                }
                //call completion handler & pass data
                completion(self.feedRows,navBarTitle)
            }else{
                print("No Data found to display!!")
                completion(self.feedRows,navBarTitle)
            }
        }
    }
    
    func getImageForCell(url:String, completionHandler:@escaping (UIImage)->()){
      let networkRequest = NetworkRequestManager()
        networkRequest.downloadImageFromURL(imageURL:url) { image in
            completionHandler(image)
        }
    }
}
