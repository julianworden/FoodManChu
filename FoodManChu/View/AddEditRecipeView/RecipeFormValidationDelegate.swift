//
//  RecipeFormValidationDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/30/22.
//

import Foundation

protocol RecipeFormValidationDelegate: AnyObject {
    func viewModel(_ viewModel: AddEditRecipeViewModel, saveFailed: Bool)
}
