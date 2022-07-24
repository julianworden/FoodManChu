//
//  HomeViewController+RecipeTableViewCellButtonDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension HomeViewController: RecipeTableViewCellButtonDelegate {
    func recipeTableViewCell(_ cell: RecipeTableViewCell, editButtonWasTapped: Bool) {
        if editButtonWasTapped {
            let addEditRecipeViewController = AddEditRecipeViewController()
            let addEditRecipeNavigationController = UINavigationController(
                rootViewController: addEditRecipeViewController
            )

            addEditRecipeViewController.title = "Edit Recipe"
            addEditRecipeViewController.viewModel = AddEditRecipeViewModel(recipeToEdit: cell.viewModel.recipe)
            present(addEditRecipeNavigationController, animated: true)
        }
    }

    func receipeTableViewCell(_ cell: RecipeTableViewCell, detailsButtonWasTapped: Bool) {
        return
    }
}
