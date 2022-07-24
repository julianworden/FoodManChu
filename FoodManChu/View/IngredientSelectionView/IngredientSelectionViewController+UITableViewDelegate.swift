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
            viewModel.selectedIngredients.append(selectedIngredient)

            cell!.isSelected = false
            cell!.accessoryType = .checkmark
        } else if cell!.isSelected && cell!.accessoryType == .checkmark {
            if let deselectedIngredientIndex = viewModel.selectedIngredients.firstIndex(of: selectedIngredient) {
                viewModel.selectedIngredients.remove(at: deselectedIngredientIndex)
            }

            cell!.isSelected = false
            cell!.accessoryType = .none
        }

//        tableView.deselectRow(at: indexPath, animated: true)
    }
}
