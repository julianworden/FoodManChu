//
//  AddEditRecipeTableViewCellViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import CoreData
import Foundation

class AddEditRecipeTableViewCellViewModel {
    var recipeToEdit: Recipe?
    var categories: [Category]?

    @Published var recipeName: String?
    @Published var recipeDetails: String?
    @Published var recipeInstructions: String?
    @Published var recipePrepTime: Int?
    @Published var recipeIngredients: [Ingredient]?
    @Published var recipeCategory: Category?

    init(recipeToEdit: Recipe?) {
        addNewIngredientsObserver()
        
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

    func generateCategories() {
        let meatCategory = Category(context: Constants.managedObjectContext)
        meatCategory.name = "Meat"

        let vegetarianCategory = Category(context: Constants.managedObjectContext)
        vegetarianCategory.name = "Vegetarian"

        let veganCategory = Category(context: Constants.managedObjectContext)
        veganCategory.name = "Vegan"

        let paleoCategory = Category(context: Constants.managedObjectContext)
        paleoCategory.name = "Paleo"

        let ketoCategory = Category(context: Constants.managedObjectContext)
        ketoCategory.name = "Keto"

        Constants.appDelegate.saveContext()
    }

    func fetchCategories() throws {
        enum FetchCategoriesError: Error, LocalizedError {
            case categoryFetchError
        }

        let fetchRequest = Category.fetchRequest()
        do {
            let categories = try Constants.managedObjectContext.fetch(fetchRequest)
            self.categories = categories
        } catch {
            throw FetchCategoriesError.categoryFetchError
        }
    }

    func addNewIngredientsObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateRecipeIngredients),
                                               name: Constants.ingredientChosenNotification,
                                               object: nil)
    }

    @objc func updateRecipeIngredients(_ notification: NSNotification) {
        if let ingredients = notification.userInfo?["ingredients"] as? [Ingredient] {
            self.recipeIngredients = ingredients
        }
    }
}
