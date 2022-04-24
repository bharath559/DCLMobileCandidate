//
//  Error.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation


struct ServerError {
    let code: String?
    let message: String?
}

enum APIError: CustomError {
    case serverError
    case jsonParserError
    case invalidRequest

    var errorDescription: String {
        let result: String
        switch self {
        case .jsonParserError: result = NSLocalizedString("Something went wrong, please try again.", comment: "")
        case .serverError: result = NSLocalizedString("Something went wrong, please try again.", comment: "")
        case .invalidRequest: result = NSLocalizedString("Something went wrong, please try again.", comment: "")
        }
        return result
    }
}

protocol CustomError: Error {
    var errorDescription: String { get }
    var errorData: [String: Any] { get }
    var innerError: Error? { get }
}

extension CustomError {
    var innerError: Error? {
        return nil
    }
    
    var errorData: [String: Any] {
        return [:]
    }
}
