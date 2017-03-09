//
//  API.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import Foundation
import Moya
import ObjectMapper
import Result

public enum Service {
    case albums
    case photos(Int)
}

extension Service: TargetType {
    public var baseURL: URL { return URL(string: "https://jsonplaceholder.typicode.com")! }
    public var path: String {
        switch self {
        case .albums:
            return "/albums"
        case let .photos(albumId):
            return "/albums/\(albumId)/photos"
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var parameters: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    public var parameterEncoding: ParameterEncoding {
        return JSONEncoding.default
    }
    public var task: Task {
        return .request
    }
    public var sampleData: Data {
        return Data()
    }
}


struct API {
    
    private static var provider: MoyaProvider<Service> = {
        let endpointClosure = { (target: Service) -> Endpoint<Service> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint
        }
        return MoyaProvider<Service>(
            endpointClosure: endpointClosure
        )
    }()
    
    private static func request(_ target: Service, success: @escaping (Response) -> Void) {
        provider.request(target) { (result) in
            DispatchQueue.global(qos: .background).async {
                switch result {
                case let .success(response):
                    if response.statusCode >= 200 && response.statusCode < 400 {
                        success(response)
                    } else {
                        print("Bad Status Code")
                    }
                case let .failure(error):
                    print(error)
                }
            }
        }
    }
    
    static func request<T: Mappable>(_ target: Service, success: @escaping (T) -> Void) {
        request(target) { (response) in
            DispatchQueue.global(qos: .background).async {
                do {
                    let body = try response.mapJSON()
                    print(body)
                    if let object = Mapper<T>().map(JSONObject: body) {
                        success(object)
                    } else {
                        print("Bad format")
                    }
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
    static func request<T: Mappable>(_ target: Service, success: @escaping ([T]) -> Void) {
        request(target) { (response) in
            DispatchQueue.global(qos: .background).async {
                do {
                    let body = try response.mapJSON()
                    print(body)
                    if let object = Mapper<T>().mapArray(JSONObject: body) {
                        success(object)
                    } else {
                        print("Bad format")
                    }
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
}
