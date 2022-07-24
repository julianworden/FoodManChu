//
//  HomeViewController+UITableViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate {
    override func setEditing(_ editing: Bool, animated: Bool) {
        let status = navigationItem.leftBarButtonItem?.title

        if status == "Edit" {
            tableView.beginUpdates()
            tableView.isEditing = true
            navigationItem.leftBarButtonItem?.title = "Done"
            tableView.endUpdates()
        } else if status == "Done" {
            tableView.beginUpdates()
            tableView.isEditing = false
            navigationItem.leftBarButtonItem?.title = "Edit"
            tableView.endUpdates()
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let recipe = viewModel.fetchedResultsController.object(at: indexPath)
            viewModel.deleteRecipe(recipe: recipe)
        }
    }
}
