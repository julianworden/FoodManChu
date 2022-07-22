//
//  HomeViewController+UITableViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let addEditRecipeViewController = AddEditRecipeViewController()
        let addEditRecipeNavigationController = UINavigationController(rootViewController: addEditRecipeViewController)
        addEditRecipeViewController.title = "Edit Recipe"
        
        present(addEditRecipeNavigationController, animated: true)
    }
}
