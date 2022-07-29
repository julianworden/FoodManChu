//
//  AddIngredientViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/27/22.
//

import Foundation

class AddIngredientViewModel {
    var ingredientName: String?

    func saveIngredient() {
        let newIngredient = Ingredient(context: Constants.managedObjectContext)

        guard ingredientName != "" else { return }

        newIngredient.name = ingredientName
        newIngredient.isUserCreated = true

        Constants.appDelegate.saveContext()
    }
}
