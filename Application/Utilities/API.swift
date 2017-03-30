//
//  API.swift
//  iOS Boilerplate
//
//  Created by Tomy Kho on 3/7/17.
//
//

import UIKit
import Moya
import RxSwift
import RxMoya
import ObjectMapper
import Result
import SwiftyUserDefaults

struct API {
    
    private static var provider: RxMoyaProvider<Service> = {
        let endpointClosure = { (target: Service) -> Endpoint<Service> in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            if Defaults[.language] == "" {
                Defaults[.language] = Locale.current.identifier
            }
            return defaultEndpoint.adding(
                newHTTPHeaderFields: [
                    "Accept-Language": Defaults[.language]
                ]
            )
        }
        return RxMoyaProvider<Service>(
            endpointClosure: endpointClosure,
            plugins: [
                NetworkActivityPlugin { (change) -> () in
                    UIApplication.shared.isNetworkActivityIndicatorVisible = change == .began
                }
            ]
        )
    }()
    
    private static func request(_ target: Service) -> Observable<Any> {
        return provider.request(target)
            .observeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .filterSuccessfulStatusCodes()
            .mapJSON()
    }
    
    static func request<T: Mappable>(_ target: Service) -> Observable<T> {
        return request(target)
            .flatMap({ (body) -> Observable<T> in
                sleep(2)
                if let object = Mapper<T>().map(JSONObject: body) {
                    return Observable.just(object)
                }
                return Observable.error(NSError(domain: target.baseURL.absoluteString, code: 400))
            })
    }
    
    static func request<T: Mappable>(_ target: Service) -> Observable<[T]>  {
        return request(target)
            .flatMap({ (body) -> Observable<[T]> in
                sleep(1)
                if let object = Mapper<T>().mapArray(JSONObject: body) {
                    return Observable.just(object)
                }
                return Observable.error(NSError(domain: target.baseURL.absoluteString, code: 400))
            })
    }
    
}
