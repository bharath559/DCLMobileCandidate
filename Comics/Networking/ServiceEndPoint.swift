//
//  ServiceEndPoint.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation

enum ServiceEndPoint {
    
    case getComics
    
    var path: String {
        switch self {
        case .getComics:
            return "/v1/public/comics"
        }
    }
        
}
