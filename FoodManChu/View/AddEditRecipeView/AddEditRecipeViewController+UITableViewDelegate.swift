//
//  AddEditRecipeViewController+UITableViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension AddEditRecipeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let ingredientIndexPath = IndexPath(row: 0, section: 4)
        let categoryIndexPath = IndexPath(row: 0, section: 5)

        switch indexPath {
        case ingredientIndexPath:
            let ingredientSelectionViewController = IngredientSelectionViewController()
            ingredientSelectionViewController.viewModel = IngredientSelectionViewModel(
                recipeToEdit: viewModel.recipeToEdit,
                ingredientsToEdit: viewModel.recipeIngredients
            )
            navigationController?.pushViewController(ingredientSelectionViewController, animated: true)
        case categoryIndexPath:
            // Push to category view controller
            return
        default:
            return
        }
    }
}
