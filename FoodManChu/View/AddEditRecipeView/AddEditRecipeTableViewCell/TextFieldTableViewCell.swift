//
//  TextFieldTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/26/22.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!
    let nameTextField = UITextField()
    let prepTimeTextField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addAndConfigureNameTextField() {
        nameTextField.placeholder = "Recipe Name"
        nameTextField.text = viewModel.recipeName
        nameTextField.addTarget(self, action: #selector(nameTextFieldChanged), for: .editingChanged)

        contentView.addSubview(nameTextField)

        nameTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            nameTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }

    func addAndConfigurePrepTimeTextField() {
        if let recipePrepTime = viewModel.recipePrepTime {
            prepTimeTextField.text = String(recipePrepTime)
        }
        prepTimeTextField.keyboardType = .decimalPad
        prepTimeTextField.placeholder = "Recipe Prep Time"
        prepTimeTextField.addTarget(self, action: #selector(prepTimeTextFieldChanged), for: .editingChanged)

        contentView.addSubview(prepTimeTextField)

        prepTimeTextField.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            prepTimeTextField.topAnchor.constraint(equalTo: contentView.topAnchor),
            prepTimeTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            prepTimeTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            prepTimeTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }

    @objc func nameTextFieldChanged() {
        viewModel.recipeName = nameTextField.text
    }

    @objc func prepTimeTextFieldChanged() {
        if let prepTime = prepTimeTextField.text {
            viewModel.recipePrepTime = Int(prepTime)
        }
    }
}
