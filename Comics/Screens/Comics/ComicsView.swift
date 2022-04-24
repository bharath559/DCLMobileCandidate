//
//  ComicsView.swift
//  Comics
//
//  Created by Bharath Kongara on 4/24/22.
//

import UIKit


class ComicsView: UIView {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var items: [Comic]  = []
    
    public func set(_ dataSource: [Comic]) {
        self.items = dataSource
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ComicsView: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        items = items.filter{ $0.title.contains(searchText)}.sorted(by: {return $0.title.lowercased() < $1.title.lowercased() })
        
        tableView.reloadData()
    }
}

extension ComicsView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let comicCell = tableView.dequeueReusableCell(withIdentifier: "ComicsTableViewCell", for: indexPath) as? ComicsTableViewCell
        
        guard let cell = comicCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        
        cell.configure(thumbNail:item.thumbNail , title: item.title)
        
        return cell
    }
}
