//
//  GetComicsResponse.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation

struct GetComicsResponse: Decodable {
    let count: Int?
    let total: Int?
    let data: ComicData?
    
    struct ComicData: Decodable {
        let results: [ComicResult]?
    }

    struct ComicResult: Decodable {
        let id: Int?
        let title: String?
        let thumbnail: ComicThumbnail?
        let stories: ComicStories?
    }

    struct ComicThumbnail: Decodable {
        let path: String?
        let fileExtension: String?
        
        enum CodingKeys: String, CodingKey {
            case path,
                 fileExtension = "extension"
        }
        
    }

    struct ComicStories: Decodable {
        let items: [ComicStory]
    }

    struct ComicStory: Decodable {
        let name: String?
        let type: String?
    }
}

extension GetComicsResponse {
    static func mockGetComicsResponse() -> GetComicsResponse {
        return GetComicsResponse(count: 1, total: 1, data: ComicData.mockData())
    }
}

extension GetComicsResponse.ComicData {
    static func mockData() -> GetComicsResponse.ComicData {
        return GetComicsResponse.ComicData(results: GetComicsResponse.ComicResult.mockResults())
    }
}

extension GetComicsResponse.ComicResult {
    
    static func mockResults() -> [GetComicsResponse.ComicResult] {
        return [GetComicsResponse.ComicResult(id: 123, title: "sample1", thumbnail: GetComicsResponse.ComicThumbnail.mockThumbnail(), stories: GetComicsResponse.ComicStories.mockStories()), GetComicsResponse.ComicResult(id: 124, title: "sample2", thumbnail: GetComicsResponse.ComicThumbnail.mockThumbnail(), stories: GetComicsResponse.ComicStories.mockStories())]
    }
}


extension GetComicsResponse.ComicThumbnail {
    static func mockThumbnail()  -> GetComicsResponse.ComicThumbnail {
        return GetComicsResponse.ComicThumbnail(path: "http://path", fileExtension: "jpg")
    }
}

extension GetComicsResponse.ComicStories {
    static func mockStories() -> GetComicsResponse.ComicStories {
        return GetComicsResponse.ComicStories(items: [GetComicsResponse.ComicStory(name: "story", type: "type")])
    }
}
