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
            let addEditRecipeViewModel = AddEditRecipeViewModel(recipeToEdit: cell.viewModel.recipe)
            let addEditRecipeNavigationController = UINavigationController(
                rootViewController: addEditRecipeViewController
            )

            addEditRecipeViewModel.recipeFormValidationDelegate = addEditRecipeViewController
            addEditRecipeViewController.viewModel = addEditRecipeViewModel
            addEditRecipeViewController.title = "Edit Recipe"
            present(addEditRecipeNavigationController, animated: true)
        }
    }

    func receipeTableViewCell(_ cell: RecipeTableViewCell, detailsButtonWasTapped: Bool) {
        let recipeDetailsViewController = RecipeDetailsViewController()
        recipeDetailsViewController.viewModel = RecipeDetailsViewModel(recipe: cell.viewModel.recipe)
        navigationController?.pushViewController(recipeDetailsViewController, animated: true)
        return
    }
}
