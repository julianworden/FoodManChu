//
//  IngredientSelectionViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import CoreData
import Foundation

class IngredientSelectionViewModel: NSObject {
    var fetchedResultsController: NSFetchedResultsController<Ingredient>!
    var recipeToEdit: Recipe?
    var ingredientsToEdit: [Ingredient]?
    var selectedIngredient: Ingredient? {
        didSet {
            NotificationCenter.default.post(name: Constants.ingredientChosenNotification,
                                            object: nil,
                                            userInfo: ["ingredient": selectedIngredient!])
        }
    }

    @Published var updatedControllerIndexPath: IndexPath?
    var controllerChangeType: NSFetchedResultsChangeType?

    init(recipeToEdit: Recipe?, ingredientsToEdit: [Ingredient]?) {
        self.recipeToEdit = recipeToEdit
        self.ingredientsToEdit = ingredientsToEdit
    }

    func deleteIngredient(ingredient: Ingredient) {
        Constants.managedObjectContext.delete(ingredient)
        Constants.appDelegate.saveContext()
    }
}

// MARK: - Generate Ingredients

// swiftlint:disable function_body_length
extension IngredientSelectionViewModel {
    func generateIngredients() {
        let hasGeneratedIngredients = UserDefaults.standard.bool(forKey: "hasGeneratedIngredients")

        if !hasGeneratedIngredients {
            let bananaIngredient = Ingredient(context: Constants.managedObjectContext)
            bananaIngredient.name = "Bananas"
            bananaIngredient.isUserCreated = false

            let strawberryIngredient = Ingredient(context: Constants.managedObjectContext)
            strawberryIngredient.name = "Strawberries"
            strawberryIngredient.isUserCreated = false

            let blueberriesIngredient = Ingredient(context: Constants.managedObjectContext)
            blueberriesIngredient.name = "Blueberries"
            blueberriesIngredient.isUserCreated = false

            let saltIngredient = Ingredient(context: Constants.managedObjectContext)
            saltIngredient.name = "Salt"
            saltIngredient.isUserCreated = false

            let pepperIngredient = Ingredient(context: Constants.managedObjectContext)
            pepperIngredient.name = "Pepper"
            pepperIngredient.isUserCreated = false

            let milkIngredient = Ingredient(context: Constants.managedObjectContext)
            milkIngredient.name = "Milk"
            milkIngredient.isUserCreated = false

            let cheeseIngredient = Ingredient(context: Constants.managedObjectContext)
            cheeseIngredient.name = "Cheese"
            cheeseIngredient.isUserCreated = false

            let oliveOilIngredient = Ingredient(context: Constants.managedObjectContext)
            oliveOilIngredient.name = "Olive Oil"
            oliveOilIngredient.isUserCreated = false

            let chickenIngredient = Ingredient(context: Constants.managedObjectContext)
            chickenIngredient.name = "Chicken"
            chickenIngredient.isUserCreated = false

            let fishIngredient = Ingredient(context: Constants.managedObjectContext)
            fishIngredient.name = "Fish"
            fishIngredient.isUserCreated = false

            let broccoliIngredient = Ingredient(context: Constants.managedObjectContext)
            broccoliIngredient.name = "Broccoli"
            broccoliIngredient.isUserCreated = false

            let celeryIngredient = Ingredient(context: Constants.managedObjectContext)
            celeryIngredient.name = "Celery"
            celeryIngredient.isUserCreated = false

            let carrotIngredient = Ingredient(context: Constants.managedObjectContext)
            carrotIngredient.name = "Carrots"
            carrotIngredient.isUserCreated = false

            let tomatoIngredient = Ingredient(context: Constants.managedObjectContext)
            tomatoIngredient.name = "Tomatoes"
            tomatoIngredient.isUserCreated = false

            let flourIngredient = Ingredient(context: Constants.managedObjectContext)
            flourIngredient.name = "Flour"
            flourIngredient.isUserCreated = false

            Constants.appDelegate.saveContext()
            UserDefaults.standard.set(true, forKey: "hasGeneratedIngredients")
        } else {
            return
        }
    }
}
