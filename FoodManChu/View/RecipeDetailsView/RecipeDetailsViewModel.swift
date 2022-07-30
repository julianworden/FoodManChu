//
//  IngredientDetailsViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/29/22.
//

import Foundation

class RecipeDetailsViewModel {
    let recipeName: String
    let recipeCategory: Category
    let recipeDetails: String
    let recipePrepTime: Int
    let recipeIngredients: [String]
    let recipeInstructions: String

    init(recipe: Recipe) {
        self.recipeName = recipe.name!
        self.recipeCategory = recipe.category!
        self.recipeDetails = recipe.details!
        self.recipePrepTime = Int(recipe.prepTime)
        self.recipeIngredients = recipe.ingredientNamesArray
        self.recipeInstructions = recipe.instructions!
    }
}
