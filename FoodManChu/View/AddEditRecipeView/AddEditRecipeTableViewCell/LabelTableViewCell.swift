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
            let sortedIngredientNameArray = ingredientNameArray.sorted()
            ingredientsListLabel.text = sortedIngredientNameArray.joined(separator: ", ")
            ingredientsListLabel.isHidden = false
        }

        ingredientsListLabel.textAlignment = .left
        ingredientsListLabel.numberOfLines = 0

        contentView.addSubview(ingredientsListLabel)

        ingredientsListLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ingredientsListLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19),
            ingredientsListLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
            ingredientsListLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            ingredientsListLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }
}
