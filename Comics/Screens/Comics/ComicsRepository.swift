//
//  ComicsRepository.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import Foundation


protocol ComicsRepositoryProtocol {
    func load(completion: @escaping (Result<[Comic], Error>) -> Swift.Void)
}

class ComicsRepository: ComicsRepositoryProtocol {
    
    let requester: DataRequester
    
    public init(requester: DataRequester = RequestManager.shared) {
        self.requester = requester
    }
    
    func load(completion: @escaping (Result<[Comic], Error>) -> Swift.Void) {
        
        let resource = resourceForComic()
        requester.request(resource: resource) { data, error  in
            
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.failure(APIError.serverError))
                return
            }
            
            do {
                let comicResponse = try resource.parse(data: data)
                guard let response = comicResponse else {
                    completion(.failure(APIError.serverError))
                    return
                }
                let comics = ComicFactory.createComics(response)
                completion(.success(comics))
                return
            } catch let error {
                completion(.failure(error))
                return
            }
        }
    }
    
    func resourceForComic() -> Resource<GetComicsResponse> {
        return Resource<GetComicsResponse>(webResource: WebResource(url: ServiceEndPoint.getComics.path, method: .get), decoder: .iso8601DateDecoder)
    }
}
