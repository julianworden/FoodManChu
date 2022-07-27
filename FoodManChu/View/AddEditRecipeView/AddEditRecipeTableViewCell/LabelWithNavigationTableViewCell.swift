//
//  LabelWithNavigationTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/26/22.
//

import UIKit

class LabelWithNavigationTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!
    let ingredientsLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addAndConfigureIngredientsLabel() {
        ingredientsLabel.text = "Ingredients"

        contentView.addSubview(ingredientsLabel)

        ingredientsLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ingredientsLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            ingredientsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ingredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            ingredientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }

}
