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

class Album: JSONDecodable {
    let id: Int
    let title : String
    
    required init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
    }
}

extension API {
    
    struct Albums {
        static let path = "albums"
        
        static func find() -> Observable<[Album]> {
            let request: APIRequest<[Album], API.Error> = API.tron.request(path)
            return request.rxResult()
        }
        
        static func photos(_ albumId: Int) -> Observable<[Photo]> {
            let request: APIRequest<[Photo], API.Error> = API.tron.request("\(path)/\(albumId)/\(Photos.path)")
            return request.rxResult()
        }
        
    }
    
}
