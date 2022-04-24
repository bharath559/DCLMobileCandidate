//
//  ComicFactory.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation

struct ComicFactory {
    
    static func createComics(_ response: GetComicsResponse) -> [Comic] {
        
        guard let data = response.data, let results = data.results, results.count > 0 else {
            return []
        }
        
        var comics = [Comic]()
        for comic in results {
            if let id = comic.id, let title = comic.title, let thumbNail = comic.thumbnail, let stories = comic.stories  {
                comics.append(Comic(id: id, title: title, thumbNail: getThumbnailURl(thumbNail), stories: createStories(stories.items)))
            }
        }
        
        return comics.sorted(by: {return $0.title.lowercased() < $1.title.lowercased() })
    }
    
    static func getThumbnailURl(_ thumbNail: GetComicsResponse.ComicThumbnail) -> URL? {
        
        guard let path = thumbNail.path, let fileExtension = thumbNail.fileExtension else {
            return nil
        }
        
        let urlString = "\(path).\(fileExtension)".replacingOccurrences(of: "http", with: "https")
        
        if let url = URL(string: urlString) {
            return url
        }
        
        return nil
    }
    
    static func createStories(_ stories: [GetComicsResponse.ComicStory]) -> [Comic.ComicStory] {
        
        var ComicStories = [Comic.ComicStory]()
        for story in stories {
            if let name = story.name, let type = story.type {
                ComicStories.append(Comic.ComicStory(name: name, type: type))
            }
        }
        
        return ComicStories
    }
}
