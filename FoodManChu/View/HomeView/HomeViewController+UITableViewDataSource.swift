//
//  HomeViewController+UITableViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = viewModel.fetchedResultsController.sections {
            return sections.count
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = viewModel.fetchedResultsController.sections {
           let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        } else {
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.homeCellReuseIdentifier, for: indexPath)

        if let cell = cell as? RecipeTableViewCell {
            configureCell(cell, indexPath: indexPath)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func configureCell(_ cell: RecipeTableViewCell, indexPath: IndexPath) {
        let recipe = viewModel.fetchedResultsController.object(at: indexPath)
        cell.viewModel = RecipeTableViewCellViewModel(recipe: recipe)
    }
}
