//
//  FeedModel.swift
//  iOS-Code-Exercise
//
//  Created by Bhushan Shinde on 31/01/18.
//  Copyright © 2018 Bhushan Shinde. All rights reserved.
//

import Foundation

struct  FeedModel : Decodable{
    let title : String?
    let rows : [row]
}

struct row : Decodable{
    var title : String?
    var description : String?
    var imageHref : String?
}
