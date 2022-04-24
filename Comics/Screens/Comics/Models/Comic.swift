//
//  Comic.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation

struct Comic: Equatable {
    let id: Int
    let title: String
    let thumbNail: URL?
    let stories: [ComicStory]
    
    struct ComicStory: Decodable {
        let name: String
        let type: String
    }
    
    static func == (lhs: Comic, rhs: Comic) -> Bool {
        lhs.id == rhs.id
    }
}
