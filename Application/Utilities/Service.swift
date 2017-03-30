//
//  Service.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/9/17.
//
//

import Foundation
import Moya

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
