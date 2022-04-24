//
//  Resource.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation


import Foundation

struct Resource<Model>  where Model: Decodable  {
    let webResource: WebResource
    let decoder: JSONDecoder
    
    public init(webResource: WebResource, decoder: JSONDecoder = .iso8601DateDecoder) {
        self.webResource = webResource
        self.decoder = decoder
    }
    
    public func parse(data: Data) throws -> Model? {
        if data.isEmpty {
            return nil
        }
        
        do {
            return try decoder.decode(Model.self, from: data)
        } catch let error {
            if let fragment =  (try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)) as? Model {
                return fragment
            } else {
                throw error
            }
        }
    }
}

extension JSONDecoder {
    static var iso8601DateDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }
}
