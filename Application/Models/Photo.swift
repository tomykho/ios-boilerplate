//
//  Photo.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import TRON
import SwiftyJSON

class Photo: JSONDecodable {
    let id: Int
    let url : String
    
    required init(json: JSON) {
        id = json["id"].intValue
        url = json["url"].stringValue
    }
}
