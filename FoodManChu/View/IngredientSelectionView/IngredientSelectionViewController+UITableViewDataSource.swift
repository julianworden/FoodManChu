//
//  IngredientSelectionViewController+UITableViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension IngredientSelectionViewController: UITableViewDataSource {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ingredientCellReuseIdentifier,
                                                 for: indexPath)
        if let cell = cell as? IngredientTableViewViewCell {
            configureCell(cell, indexPath: indexPath)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func configureCell(_ cell: IngredientTableViewViewCell, indexPath: IndexPath) {
        var contentConfiguration = cell.defaultContentConfiguration()
        let ingredient = viewModel.fetchedResultsController.object(at: indexPath)

        contentConfiguration.text = ingredient.name
        cell.contentConfiguration = contentConfiguration
    }
}
