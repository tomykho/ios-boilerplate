//
//  API.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import Foundation
import UIKit
import Alamofire
import TRON
import SwiftyJSON
import RxSwift
import SwiftyUserDefaults

struct API {
    
    private static var tron: TRON = {
        let tron = TRON(
            baseURL: "https://jsonplaceholder.typicode.com",
            plugins: [
                NetworkLoggerPlugin(),
                NetworkActivityPlugin(application: UIApplication.shared),
                RequestPlugin()
            ]
        )
        return tron
    }()
    
    class RequestPlugin: Plugin {
        
        func willSendRequest<Model, ErrorModel>(_ request: BaseRequest<Model, ErrorModel>) {
            request.headers = [
                "Accept": "application/json",
                "Accept-Language": Defaults[.language]
            ]
            #if DEBUG
                print("Request URL: \(request.urlBuilder.url(forPath: request.path))")
                print("Request Headers: \(request.headers)")
                print("Request Parameters: \(request.parameters)")
            #endif
        }
        
        func didReceiveDataResponse<Model,ErrorModel>(_ response: DataResponse<Model>, forRequest request: Alamofire.Request, formedFrom tronRequest: BaseRequest<Model,ErrorModel>) {
            #if DEBUG
                if let data = response.data {
                    let json = JSON(data: data)
                    print("Response Body: \(json)")
                }
            #endif
        }
        
    }
    
    class Error : JSONDecodable {
        
        required init(json: JSON) {
        }
        
    }
    
    struct Albums {
        static let path = "albums"
        
        static func find() -> Observable<[Album]> {
            let request: APIRequest<[Album], API.Error> = tron.request(path)
            return request.rxResult()
        }
        
        static func photos(_ albumId: Int) -> Observable<[Photo]> {
            let request: APIRequest<[Photo], API.Error> = tron.request("\(path)/\(albumId)/\(Photos.path)")
            return request.rxResult()
        }
        
    }
    
    struct Photos {
        static let path = "photos"
        
        static func find() -> Observable<[Photo]> {
            let request: APIRequest<[Photo], API.Error> = tron.request(path)
            return request.rxResult()
        }
    }
    
}

extension Array : JSONDecodable {
    public init(json: JSON) {
        self.init(json.arrayValue.flatMap {
            if let type = Element.self as? JSONDecodable.Type {
                let element : Element?
                do {
                    element = try type.init(json: $0) as? Element
                } catch {
                    return nil
                }
                return element
            }
            return nil
        })
    }
}
