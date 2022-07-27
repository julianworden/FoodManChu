//
//  LabelTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/26/22.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!
    let ingredientsListLabel = UILabel()

    func addAndConfigureIngredientsListLabel() {
        if let ingredients = viewModel.recipeToEdit?.ingredientsArray {
            let ingredientNameArray = ingredients.map { $0.name! }
            ingredientsListLabel.text = ingredientNameArray.joined(separator: ", ")
        }

        contentView.addSubview(ingredientsListLabel)

        ingredientsListLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ingredientsListLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            ingredientsListLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ingredientsListLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            ingredientsListLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }
}
