//
//  AddEditRecipeTableViewCellViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation

class AddEditRecipeTableViewCellViewModel {
    var recipeToEdit: Recipe?

    @Published var recipeName: String?
    @Published var recipeDetails: String?
    @Published var recipeInstructions: String?
    @Published var recipePrepTime: Int?
    @Published var recipeIngredients: [Ingredient]?
    @Published var recipeCategory: Category?

    init(recipeToEdit: Recipe?) {
        if let recipeToEdit = recipeToEdit {
            self.recipeToEdit = recipeToEdit
            self.recipeName = recipeToEdit.name
            self.recipeDetails = recipeToEdit.details
            self.recipeInstructions = recipeToEdit.instructions
            self.recipePrepTime = Int(recipeToEdit.prepTime)
//            self.recipeIngredients = recipeToEdit.ingredients
            self.recipeCategory = recipeToEdit.category
        }
    }
}
