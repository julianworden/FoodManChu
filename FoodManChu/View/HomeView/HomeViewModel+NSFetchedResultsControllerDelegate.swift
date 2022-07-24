//
//  HomeViewModel+NSFetchedResultsControllerDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import CoreData
import Foundation

extension HomeViewModel: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?
    ) {
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
}
