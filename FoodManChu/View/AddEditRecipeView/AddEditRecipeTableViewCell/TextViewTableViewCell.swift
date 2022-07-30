//
//  TextViewTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/26/22.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!
    let detailsTextView = UITextView()
    let instructionsTextView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func addAndConfigureDescriptionTextView() {
        if detailsTextView.text == nil || viewModel.recipeDetails != nil {
            detailsTextView.text = viewModel.recipeDetails
        }
        detailsTextView.font = .systemFont(ofSize: 18)
        detailsTextView.delegate = self

        contentView.addSubview(detailsTextView)

        detailsTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            detailsTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            detailsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            detailsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            detailsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }

    func addAndConfigureInstructionsTextView() {
        if instructionsTextView.text == nil || viewModel.recipeInstructions != nil {
            instructionsTextView.text = viewModel.recipeInstructions
        }
        instructionsTextView.text = viewModel.recipeInstructions
        instructionsTextView.font = .systemFont(ofSize: 18)
        instructionsTextView.delegate = self
        instructionsTextView.refreshControl?.addTarget(
            self,
            action: #selector(instructionsTextViewChanged),
            for: .editingChanged
        )

        contentView.addSubview(instructionsTextView)

        instructionsTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            instructionsTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            instructionsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            instructionsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            instructionsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
        ])
    }

    @objc func detailsTextViewChanged() {
        viewModel.recipeDetails = detailsTextView.text
    }

    @objc func instructionsTextViewChanged() {
        viewModel.recipeInstructions = instructionsTextView.text
    }
}
