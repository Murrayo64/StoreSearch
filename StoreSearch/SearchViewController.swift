//
//  SearchViewController.swift
//  StoreSearch
//
//  Created by JAM on 2/20/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchResults = [SearchResult]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 51, left: 0, bottom: 0, right: 0)
    }


}

// MARK: - Search Bar Delegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        searchResults = []
        for i in 0...2 {
            let searchResult = SearchResult()
            searchResult.name = String(format: "Fake Result %d for", i)
            searchResult.artistName = searchBar.text!
            searchResults.append(searchResult)
        }
        tableView.reloadData()
    }
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}
// MARK: - Table View Delegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cellIdentifier = "SearchResultCell"
            
            var cell = tableView.dequeueReusableCell(
                withIdentifier: cellIdentifier)
            if cell == nil {
                cell = UITableViewCell(
                    style: .subtitle, reuseIdentifier: cellIdentifier)
            }
        let searchResult = searchResults[indexPath.row]
        cell?.textLabel!.text = searchResult.name
        cell?.detailTextLabel!.text = searchResult.artistName
        return cell!
        }
    }


