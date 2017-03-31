//
//  Photo.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import TRON
import SwiftyJSON

class Album: JSONDecodable {
    let id: Int
    let title : String
    
    required init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
    }
}
