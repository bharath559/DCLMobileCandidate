//
//  RequestManager.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation
import CryptoKit

protocol DataRequester: AnyObject {
    func request<Model>(resource: Resource<Model>, completion: @escaping (Data?, Error?) -> Swift.Void)
}

class RequestManager: DataRequester {
    static let shared = RequestManager()
    let sessionManager = URLSession.shared
    
    private var baseDomainURL: String {
        return "https://gateway.marvel.com:443/"
    }
    
    public init() {
        
    }
    
    func request<Model>(resource: Resource<Model>, completion: @escaping (Data?, Error?) -> Swift.Void){
        
        guard let urlRequest = resource.webResource.request else {
            completion(nil, APIError.invalidRequest)
            return
        }
        
        sessionManager.dataTask(with: urlRequest) { data, response, error in
            guard let error = error else {
               completion(data, nil)
                return
            }
            
            completion(nil, error)
            
            return
        }.resume()
    }
}
