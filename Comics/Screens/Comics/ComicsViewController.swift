//
//  ComicsViewController.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import UIKit

class ComicsViewController: UIViewController {

    @IBOutlet var comicsView: ComicsView!
    
    var viewModel: ComicsViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        viewModel = ComicsViewModel(repository: ComicsRepository())
        viewModel?.delegate = self
        viewModel?.loadComics()
    }
}

extension ComicsViewController: ComicsViewModelDelegate {
    func dataLoaded(_ items: [Comic]) {
        comicsView.set(items)
    }
    
    func showError(_ alert: UIAlertController) {
        present(alert, animated: true)
    }
}
