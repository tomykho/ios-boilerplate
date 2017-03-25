//
//  Photo.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import ObjectMapper

struct Photo: Mappable {
    
    var id: Int!
    var url: String!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        url <- map["url"]
    }
    
}
