//
//  Response.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation

struct Response<Model> {
    let response: Int?
    let data: Model
}
