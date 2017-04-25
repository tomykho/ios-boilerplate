//
//  Photo.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import TRON
import SwiftyJSON
import RxSwift

class Photo: JSONDecodable {
    let id: Int
    let url : String
    
    required init(json: JSON) {
        id = json["id"].intValue
        url = json["url"].stringValue
    }
}

extension API {
    
    struct Photos {
        static let path = "photos"
        
        static func find() -> Observable<[Photo]> {
            let request: APIRequest<[Photo], API.Error> = API.tron.request(path)
            return request.rxResult()
        }
    }
        
}
  
