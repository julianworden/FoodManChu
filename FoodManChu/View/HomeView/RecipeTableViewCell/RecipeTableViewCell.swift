//
//  RecipeTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    var viewModel: RecipeTableViewCellViewModel! {
        didSet {
            configureViews()
            layoutViews()
        }
    }

    lazy var labelStack = UIStackView(arrangedSubviews: [recipeNameLabel, recipePrepTimeLabel, recipeDetailsLabel])
    let recipeNameLabel = UILabel()
    let recipePrepTimeLabel = UILabel()
    let recipeDetailsLabel = UILabel()
    lazy var buttonStack = UIStackView(arrangedSubviews: [editButton, detailsButton])
    let editButton = UIButton(configuration: .bordered())
    let detailsButton = UIButton(configuration: .bordered())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureViews() {
        labelStack.axis = .vertical
        labelStack.alignment = .leading
        labelStack.distribution = .fill

        recipeNameLabel.text = viewModel.recipeName

        recipePrepTimeLabel.text = String(viewModel.recipePrepTime)

        recipeDetailsLabel.text = viewModel.recipeDetails

        buttonStack.axis = .horizontal
        buttonStack.distribution = .fillEqually

        editButton.setTitle("Edit", for: .normal)

        detailsButton.setTitle("Details", for: .normal)
    }
}

// MARK: - Constraints

extension RecipeTableViewCell {
    func layoutViews() {
        contentView.addSubview(labelStack)
        contentView.addSubview(buttonStack)

        labelStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            labelStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            labelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            buttonStack.topAnchor.constraint(equalTo: labelStack.bottomAnchor, constant: 8),
            buttonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

            editButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
