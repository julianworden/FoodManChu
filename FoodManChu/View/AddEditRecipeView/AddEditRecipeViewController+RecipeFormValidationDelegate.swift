//
//  AddEditRecipeViewController+RecipeFormValidationDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/30/22.
//

import Foundation
import UIKit

extension AddEditRecipeViewController: RecipeFormValidationDelegate {
    func viewModel(_ viewModel: AddEditRecipeViewModel, saveFailed: Bool) {
        let alert = UIAlertController(
            title: "Save Error",
            message: "Please ensure that all fields have been filled in.",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)

        present(alert, animated: true)
    }
}
