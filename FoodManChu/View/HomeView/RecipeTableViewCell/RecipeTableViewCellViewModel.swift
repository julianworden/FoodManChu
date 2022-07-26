//
//  RecipeTableViewCellViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation

class RecipeTableViewCellViewModel {
    let recipe: Recipe
    let recipeName: String
    let recipePrepTime: Int
    let recipeDetails: String

    init(recipe: Recipe) {
        self.recipe = recipe
        self.recipeName = recipe.name ?? ""
        self.recipePrepTime = Int(recipe.prepTime)
        self.recipeDetails = recipe.details ?? ""
    }
}
