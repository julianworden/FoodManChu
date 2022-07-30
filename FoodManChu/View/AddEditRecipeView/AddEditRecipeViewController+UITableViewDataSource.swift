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
        switch section {
        case 4:
            return 2
        default:
            return 1
        }
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

    // swiftlint:disable cyclomatic_complexity
    // swiftlint:disable function_body_length
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case IndexPath(row: 0, section: 0):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.textFieldCellReuseIdentifier,
                for: indexPath
            ) as? TextFieldTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureNameTextField()
                cell.selectionStyle = .none
                newRecipeNameSubscriber = cell.viewModel.$recipeName
                    .sink(receiveValue: { [weak self] recipeName in
                        if let recipeName = recipeName {
                            self?.viewModel.recipeName = recipeName
                        }
                    })
                return cell
            }
        case IndexPath(row: 0, section: 1):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.textViewCellReuseIdentifier,
                for: indexPath
            ) as? TextViewTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureDescriptionTextView()
                cell.selectionStyle = .none
                newRecipeDetailsSubscriber = cell.viewModel.$recipeDetails
                    .sink(receiveValue: { [weak self] recipeDetails in
                        if let recipeDetails = recipeDetails {
                            self?.viewModel.recipeDetails = recipeDetails
                        }
                    })
                return cell
            }
        case IndexPath(row: 0, section: 2):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.textViewCellReuseIdentifier,
                for: indexPath
            ) as? TextViewTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureInstructionsTextView()
                cell.selectionStyle = .none
                newRecipeInstructionsSubscriber = cell.viewModel.$recipeInstructions
                    .sink(receiveValue: { [weak self] recipeInstructions in
                        if let recipeInstructions = recipeInstructions {
                            self?.viewModel.recipeInstructions = recipeInstructions
                        }
                    })
                return cell
            }
        case IndexPath(row: 0, section: 3):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.textFieldCellReuseIdentifier,
                for: indexPath
            ) as? TextFieldTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigurePrepTimeTextField()
                cell.selectionStyle = .none
                newRecipePrepTimeSubscriber = cell.viewModel.$recipePrepTime
                    .sink(receiveValue: { [weak self] recipePrepTime in
                        if let recipePrepTime = recipePrepTime {
                            self?.viewModel.recipePrepTime = recipePrepTime
                        }
                    })
                return cell
            }
        case IndexPath(row: 0, section: 4):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.labelWithNavigationCellReuseIdentifier,
                for: indexPath
            ) as? LabelWithNavigationTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureIngredientsLabel()
                cell.accessoryType = .disclosureIndicator
                return cell
            }
        case IndexPath(row: 1, section: 4):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.labelCellReuseIdentifier,
                for: indexPath
            ) as? LabelTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureIngredientsListLabel()
                newRecipeIngredientsSubscriber = cell.viewModel.$recipeIngredients
                    .sink(receiveValue: { [weak self] ingredients in
                        if let ingredients = ingredients {
                            self?.viewModel.recipeIngredients = ingredients
                            let ingredientNameArray = ingredients.map { $0.name! }
                            let sortedIngredientNameArray = ingredientNameArray.sorted()
                            cell.ingredientsListLabel.text = sortedIngredientNameArray.joined(separator: ", ")
                            tableView.reloadRows(at: [IndexPath(row: 0, section: 4)], with: .none)
                        }
                    })
                return cell
            }
        case IndexPath(row: 0, section: 5):
            if let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.pickerViewCellReuseIdentifier,
                for: indexPath
            ) as? PickerViewTableViewCell {
                cell.viewModel = AddEditRecipeTableViewCellViewModel(recipeToEdit: viewModel.recipeToEdit)
                cell.addAndConfigureCategoryPicker()
                newRecipeCategorySubscriber = cell.viewModel.$recipeCategory
                    .sink(receiveValue: { [weak self] newRecipeCategory in
                        self?.viewModel.recipeCategory = newRecipeCategory
                    })
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            return 85
        case IndexPath(row: 0, section: 2):
            return 150
        case IndexPath(row: 1, section: 4):
            return UITableView.automaticDimension
        case IndexPath(row: 0, section: 5):
            return 150
        default:
            return 44
        }
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case IndexPath(row: 0, section: 1):
            return 85
        case IndexPath(row: 0, section: 2):
            return 150
        case IndexPath(row: 1, section: 4):
            return UITableView.automaticDimension
        case IndexPath(row: 0, section: 5):
            return 150
        default:
            return 44
        }
    }
}
