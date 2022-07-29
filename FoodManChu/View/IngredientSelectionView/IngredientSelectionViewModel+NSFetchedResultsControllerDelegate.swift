//
//  IngredientSelectionViewModel+NSFetchedResultsControllerDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import CoreData
import Foundation

extension IngredientSelectionViewModel: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let indexPath = newIndexPath {
                self.controllerChangeType = .insert
                self.updatedControllerIndexPath = indexPath
            }
        case .delete:
            if let indexPath = indexPath {
                self.controllerChangeType = .delete
                self.updatedControllerIndexPath = indexPath
            }
        case .move:
            if let indexPath = newIndexPath {
                self.controllerChangeType = .move
                self.updatedControllerIndexPath = indexPath
            }
        case .update:
            if let indexPath = indexPath {
                self.controllerChangeType = .update
                self.updatedControllerIndexPath = indexPath
            }
        @unknown default:
            break
        }
    }

    func fetchIngredients() {
        let fetchRequest = Ingredient.fetchRequest()
        let nameSort = NSSortDescriptor(key: "name", ascending: true)
        let userCreatedSort = NSSortDescriptor(key: "isUserCreated", ascending: false)
        fetchRequest.sortDescriptors = [userCreatedSort, nameSort]

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
}
