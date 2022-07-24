//
//  AddEditRecipeViewController+UITableViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation
import UIKit

extension AddEditRecipeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Name"
        case 1:
            return "Description"
        case 2:
            return "Instructions"
        case 3:
            return "Prep Time (mins)"
        case 4:
            return "Ingredients"
        case 5:
            return "Category"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.addEditRecipeCellReuseIdentifier,
                                                 for: indexPath)
        if let cell = cell as? AddEditRecipeTableViewCell {
            configureCell(cell, indexPath: indexPath)
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func configureCell(_ cell: AddEditRecipeTableViewCell, indexPath: IndexPath) {
        cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)

        switch indexPath.section {
        case 0:
            newRecipeNameSubscriber = cell.viewModel.$recipeName
                .sink(receiveValue: { [weak self] recipeName in
                    if let recipeName = recipeName {
                        self?.viewModel.recipeName = recipeName
                    }
                })
            cell.addAndConfigureNameTextField()
            cell.selectionStyle = .none
        case 1:
            cell.addAndConfigureDescriptionTextView()
            cell.selectionStyle = .none
            newRecipeDetailsSubscriber = cell.viewModel.$recipeDetails
                .sink(receiveValue: { [weak self] recipeDetails in
                    if let recipeDetails = recipeDetails {
                        self?.viewModel.recipeDetails = recipeDetails
                    }
                })
        case 2:
            cell.addAndConfigureInstructionsTextView()
            cell.selectionStyle = .none
            newRecipeInstructionsSubscriber = cell.viewModel.$recipeInstructions
                .sink(receiveValue: { [weak self] recipeInstructions in
                    if let recipeInstructions = recipeInstructions {
                        self?.viewModel.recipeInstructions = recipeInstructions
                    }
                })
        case 3:
            cell.addAndConfigurePrepTimeTextField()
            cell.selectionStyle = .none
            newRecipePrepTimeSubscriber = cell.viewModel.$recipePrepTime
                .sink(receiveValue: { [weak self] recipePrepTime in
                    if let recipePrepTime = recipePrepTime {
                        self?.viewModel.recipePrepTime = recipePrepTime
                    }
                })
        case 4:
            cell.addAndConfigureIngredientsLabel()
            cell.accessoryType = .disclosureIndicator
        case 5:
            cell.addAndConfigureCategoryPicker()
            newRecipeCategorySubscriber = cell.viewModel.$recipeCategory
                .sink(receiveValue: { [weak self] newRecipeCategory in
                    self?.viewModel.recipeCategory = newRecipeCategory
                })
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1, 2:
            return 85
        case 5:
            return 150
        default:
            return 44
        }
    }
}
