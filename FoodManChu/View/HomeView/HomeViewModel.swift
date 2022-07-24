//
//  HomeViewModel.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import CoreData

class HomeViewModel: NSObject {
    var fetchedResultsController: NSFetchedResultsController<Recipe>!
    @Published var updatedControllerIndexPath: IndexPath?
    var controllerChangeType: NSFetchedResultsChangeType?

    func generateExampleRecipe() {
        let exampleRecipe = Recipe(context: Constants.managedObjectContext)
        exampleRecipe.name = "Eggs"
        exampleRecipe.details = "They come from chickens, usually anyway."
        exampleRecipe.prepTime = 5

        Constants.appDelegate.saveContext()
    }

    func fetchRecipes() {
        let fetchRequest = Recipe.fetchRequest()
        fetchRequest.sortDescriptors = []

        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: Constants.managedObjectContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)

        fetchedResultsController.delegate = self
        self.fetchedResultsController = fetchedResultsController

        do {
            try fetchedResultsController.performFetch()
        } catch {
            print(error)
        }
    }

    func deleteRecipe(recipe: Recipe) {
        Constants.managedObjectContext.delete(recipe)
        Constants.appDelegate.saveContext()
    }
}
