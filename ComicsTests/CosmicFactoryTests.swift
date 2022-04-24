//
//  ComicFactoryTests.swift
//  ComicsTests
//
//  Created by Bharath Kongara on 4/24/22.
//

import XCTest
@testable import Comics

class ComicFactoryTests: XCTestCase {

    func testCreateComics() throws {
        let comics = ComicFactory.createComics(GetComicsResponse.mockGetComicsResponse())
        
        let expectedComics = [Comic(id: 123, title: "sample1", thumbNail: URL(string: "https://path.jpg"), stories: [Comics.Comic.ComicStory(name: "story", type: "type")]), Comic(id: 124, title: "sample2", thumbNail: URL(string: "https://path.jpg"), stories: [Comics.Comic.ComicStory(name: "story", type: "type")])]
        XCTAssertEqual(expectedComics, comics)
    }
    
    func testGetThumbNailURL() {
        var thumbNailURL = ComicFactory.getThumbnailURl(GetComicsResponse.ComicThumbnail.mockThumbnail())
        
        XCTAssertEqual(thumbNailURL, URL(string: "https://path.jpg"))
        thumbNailURL = ComicFactory.getThumbnailURl(GetComicsResponse.ComicThumbnail(path: "h://blah", fileExtension: nil))
        XCTAssertNil(thumbNailURL)
    }

}
