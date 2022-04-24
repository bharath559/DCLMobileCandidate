//
//  WebResource.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation
import CryptoKit


struct WebResource {
    
    enum Method {
        case get
        case post
    }
    
    let url: String
    let method: Method
    let params: [String: Any]?
    let headers: [String: Any]?
    
    let privateKey = "e6e5641e7a179ae96dda79d547903a6c73e48ecf"
    let publicKey = "56f3feb485c4062fa0a83afc21481cbb"
    let apiKey = "56f3feb485c4062fa0a83afc21481cbb"
    let baseURL = "https://gateway.marvel.com:443"
        
    public init(url: String, method: Method, params: [String: Any]? = nil, headers: [String: Any]? = nil) {
        self.url = url
        self.method = method
        self.params = params
        self.headers = headers
    }
}

extension WebResource {
    
    var request: URLRequest? {
        let hash = md5Hash()
        let urlString = "\(baseURL)\(url)?ts=\(hash.1)&apikey=\(apiKey)&hash=\(hash.0)"
        guard let url = URL(string: urlString) else {
            return nil
        }
        
        return URLRequest(url: url)
    }
    
    func getTimeStamp() -> Double {
        return Date().timeIntervalSince1970
    }
    
    func md5Hash() -> (String, Double) {
        let timeStamp = getTimeStamp()
        let signRequestString = "\(timeStamp)\(privateKey)\(publicKey)"
        
        let digest = Insecure.MD5.hash(data: signRequestString.data(using: .utf8) ?? Data())
        let hash = digest.map { String(format: "%02hhx", $0) }.joined()
        return (hash, timeStamp)
    }
}
