//
//  IngredientSelectionViewController+UITableViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension IngredientSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let selectedIngredient = viewModel.fetchedResultsController.object(at: indexPath)

        if cell!.isSelected && cell!.accessoryType == .none {
            viewModel.selectedIngredient = selectedIngredient

            cell!.isSelected = false
            cell!.accessoryType = .checkmark
        } else if cell!.isSelected && cell!.accessoryType == .checkmark {
            viewModel.selectedIngredient = selectedIngredient

            cell!.isSelected = false
            cell!.accessoryType = .none
        }
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        let status = navigationItem.leftBarButtonItem?.title

        if status == "Edit" {
            tableView.beginUpdates()
            tableView.isEditing = true
            navigationItem.leftBarButtonItem?.title = "Done"
            tableView.endUpdates()
        } else if status == "Done" {
            tableView.beginUpdates()
            tableView.isEditing = false
            navigationItem.leftBarButtonItem?.title = "Edit"
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let ingredient = viewModel.fetchedResultsController.object(at: indexPath)

        if ingredient.isUserCreated {
            return .delete
        } else {
            return .none
        }
    }

    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let ingredient = viewModel.fetchedResultsController.object(at: indexPath)
            viewModel.selectedIngredient = ingredient
            viewModel.deleteIngredient(ingredient: ingredient)
        }
    }
}
