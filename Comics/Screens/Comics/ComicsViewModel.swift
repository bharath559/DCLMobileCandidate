//
//  ComicsViewModel.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import UIKit

protocol ComicsViewModelDelegate: AnyObject {
    func dataLoaded(_ items: [Comic])
    func showError(_ alert: UIAlertController)
}


class ComicsViewModel {
    let repository: ComicsRepositoryProtocol
    
    public weak var delegate: ComicsViewModelDelegate?
    
    public init(repository: ComicsRepositoryProtocol) {
        self.repository = repository
    }
    
    public func loadComics() {
        repository.load { [weak self]  comicResult in
            
            switch comicResult {
            case .success(let items):
                self?.delegate?.dataLoaded(items)
            case .failure(let error):
                let alertViewController = UIAlertController(title: "Data load failure", message: "try again", preferredStyle: .alert)
                self?.delegate?.showError(alertViewController)
            }
        }
    }
}
