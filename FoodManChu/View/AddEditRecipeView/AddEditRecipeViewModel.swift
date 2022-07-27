//
//  AddEditRecipeViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation

class AddEditRecipeViewModel {
    var recipeToEdit: Recipe?

    var recipeName: String?
    var recipeDetails: String?
    var recipeInstructions: String?
    var recipePrepTime: Int?
    var recipeIngredients: [Ingredient]?
    var recipeCategory: Category?

    init(recipeToEdit: Recipe?) {
        if let recipeToEdit = recipeToEdit {
            self.recipeToEdit = recipeToEdit
            self.recipeName = recipeToEdit.name
            self.recipeDetails = recipeToEdit.details
            self.recipeInstructions = recipeToEdit.instructions
            self.recipePrepTime = Int(recipeToEdit.prepTime)
            self.recipeIngredients = recipeToEdit.ingredientsArray
            self.recipeCategory = recipeToEdit.category
        }
    }

    func saveRecipe() {
        var recipe: Recipe!

        if recipeToEdit != nil {
            recipe = recipeToEdit
        } else {
            recipe = Recipe(context: Constants.managedObjectContext)
        }

            guard let recipeName = recipeName,
              let recipeDetails = recipeDetails,
              let recipeInstructions = recipeInstructions,
              let recipePrepTime = recipePrepTime,
              let recipeCategory = recipeCategory,
              let recipeIngredients = recipeIngredients else { return }

        recipe.name = recipeName
        recipe.details = recipeDetails
        recipe.instructions = recipeInstructions
        recipe.prepTime = Int16(recipePrepTime)
        recipe.category = recipeCategory

        let recipeIngredientsSet = Set(recipeIngredients)
        let recipeIngredientsNSSet = recipeIngredientsSet as NSSet
        recipe.ingredients = recipeIngredientsNSSet

        Constants.appDelegate.saveContext()
    }
}
