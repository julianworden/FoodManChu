//
//  HomeViewController+UISearchResultsUpdating.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/28/22.
//

import Foundation
import UIKit

extension HomeViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        viewModel.filterContentForSearchText(searchBar.text!)
        tableView.reloadData()
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        viewModel.searchControllerWasDismissed()
        tableView.reloadData()
    }
}
