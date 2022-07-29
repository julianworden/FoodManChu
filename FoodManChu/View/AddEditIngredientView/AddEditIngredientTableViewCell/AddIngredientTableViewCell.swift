//
//  AddIngredientTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/27/22.
//

import UIKit

class AddIngredientTableViewCell: UITableViewCell {
    var viewModel = AddIngredientTableViewCellViewModel()

    let ingredientTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
        layoutViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureViews() {
        ingredientTextField.placeholder = "Ingredient Name"
        ingredientTextField.addTarget(self, action: #selector(ingredientTextFieldChanged), for: .editingChanged)
    }

    @objc func ingredientTextFieldChanged() {
        viewModel.ingredientName = ingredientTextField.text
    }
}

// MARK: - Constraints

extension AddIngredientTableViewCell {
    func layoutViews() {
        contentView.addSubview(ingredientTextField)

        ingredientTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            ingredientTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            ingredientTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            ingredientTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            ingredientTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }
}
