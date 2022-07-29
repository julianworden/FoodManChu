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
    var controllerChangeType: NSFetchedResultsChangeType?
    var searchText = ""

    @Published var updatedControllerIndexPath: IndexPath?

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

// MARK: - Searching

extension HomeViewModel {
    func filterContentForSearchText(_ searchText: String) {
        var prepTimePredicate: NSPredicate?
        let namePredicate = NSPredicate(format: "name CONTAINS [c] %@", searchText)
        let detailsPredicate = NSPredicate(format: "details CONTAINS [c] %@", searchText)
        let categoryPredicate = NSPredicate(format: "category.name CONTAINS [c] %@", searchText)
        let instructionsPredicate = NSPredicate(format: "instructions CONTAINS [c] %@", searchText)
        // TODO: Make ingredients predicate
        if let searchTextAsInt = Int(searchText) {
            prepTimePredicate = NSPredicate(format: "prepTime <= %i", searchTextAsInt)
        }

        if let prepTimePredicate = prepTimePredicate {
            let predicates = [
                namePredicate,
                detailsPredicate,
                categoryPredicate,
                prepTimePredicate,
                instructionsPredicate
            ]
            fetchedResultsController.fetchRequest.predicate = NSCompoundPredicate(
                orPredicateWithSubpredicates: predicates
            )
        } else {
            let predicates = [
                namePredicate,
                detailsPredicate,
                categoryPredicate,
                instructionsPredicate
            ]
            fetchedResultsController.fetchRequest.predicate = NSCompoundPredicate(
                orPredicateWithSubpredicates: predicates
            )
        }

        try? fetchedResultsController.performFetch()
    }

    func searchControllerWasDismissed() {
        fetchedResultsController.fetchRequest.predicate = nil
        try? fetchedResultsController.performFetch()
    }
}
