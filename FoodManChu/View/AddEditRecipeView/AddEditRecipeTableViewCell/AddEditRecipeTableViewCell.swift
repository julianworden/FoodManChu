//
//  AddEditRecipeTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import UIKit

class AddEditRecipeTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!

    // ADD TARGETS TO EACH TEXTFIELD TO TELL VIEWMODEL PROPERTIES WHEN VALUES CHANGED
    let nameTextField = UITextField()
    let detailsTextView = UITextView()
    let instructionsTextView = UITextView()
    let prepTimeTextField = UITextField()
    let ingredientsLabel = UILabel()
    let categoryPicker = UIPickerView()

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

    func addAndConfigureDescriptionTextView() {
        detailsTextView.text = viewModel.recipeDetails
        detailsTextView.font = .systemFont(ofSize: 18)
        detailsTextView.textContainer.maximumNumberOfLines = 3
        detailsTextView.isScrollEnabled = false
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
        instructionsTextView.text = viewModel.recipeInstructions
        instructionsTextView.font = .systemFont(ofSize: 18)
        instructionsTextView.textContainer.maximumNumberOfLines = 3
        instructionsTextView.isScrollEnabled = false
        instructionsTextView.delegate = self
        instructionsTextView.refreshControl?.addTarget(self,
                                                       action: #selector(instructionsTextViewChanged),
                                                       for: .editingChanged)

        contentView.addSubview(instructionsTextView)

        instructionsTextView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            instructionsTextView.topAnchor.constraint(equalTo: contentView.topAnchor),
            instructionsTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            instructionsTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 19),
            instructionsTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -19)
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

    func addAndConfigureCategoryPicker() {
//        viewModel.generateCategories()
        do {
            try viewModel.fetchCategories()
        } catch {
            print(error)
        }

        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        if let recipeToEdit = viewModel.recipeToEdit,
           let categoryIndexPosition = viewModel.categories?.firstIndex(of: recipeToEdit.category!) {
            categoryPicker.selectRow(categoryIndexPosition, inComponent: 0, animated: true)
        }

        contentView.addSubview(categoryPicker)

        categoryPicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryPicker.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryPicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryPicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            categoryPicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }

    @objc func nameTextFieldChanged() {
        viewModel.recipeName = nameTextField.text
    }

    @objc func detailsTextViewChanged() {
        viewModel.recipeDetails = detailsTextView.text
    }

    @objc func instructionsTextViewChanged() {
        viewModel.recipeInstructions = instructionsTextView.text
    }

    @objc func prepTimeTextFieldChanged() {
        if let prepTime = prepTimeTextField.text {
            viewModel.recipePrepTime = Int(prepTime)
        }
    }
}
