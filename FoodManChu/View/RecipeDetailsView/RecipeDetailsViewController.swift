//
//  IngredientDetailsViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/29/22.
//

import UIKit

class RecipeDetailsViewController: UIViewController {
    var viewModel: RecipeDetailsViewModel! {
        didSet {
            configureViews()
            layoutViews()
        }
    }

    let scrollView = UIScrollView()
    lazy var contentStack = UIStackView(
        arrangedSubviews: [
            mainLabelStack,
            subLabelStack
        ]
    )
    lazy var mainLabelStack = UIStackView(
        arrangedSubviews: [
            recipeNameLabel,
            recipeCategoryLabel,
            recipePrepTimeLabel
        ]
    )
    let recipeNameLabel = UILabel()
    let recipeCategoryLabel = UILabel()
    let recipePrepTimeLabel = UILabel()
    lazy var subLabelStack = UIStackView(
        arrangedSubviews: [
            recipeDetailsStack,
            recipeIngredientsStack,
            recipeInstructionsStack
        ]
    )
    lazy var recipeDetailsStack = UIStackView(
        arrangedSubviews: [
            detailsLabel,
            recipeDetailsLabel
        ]
    )
    let detailsLabel = UILabel()
    let recipeDetailsLabel = UILabel()
    lazy var recipeIngredientsStack = UIStackView(
        arrangedSubviews: [
            ingredientsLabel,
            recipeIngredientsLabel
        ]
    )
    let ingredientsLabel = UILabel()
    let recipeIngredientsLabel = UILabel()
    lazy var recipeInstructionsStack = UIStackView(
        arrangedSubviews: [
            instructionsLabel,
            recipeInstructionsLabel
        ]
    )
    let instructionsLabel = UILabel()
    let recipeInstructionsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // swiftlint:disable function_body_length
    func configureViews() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never

        contentStack.axis = .vertical
        contentStack.distribution = .fill
        contentStack.alignment = .center
        contentStack.spacing = 5

        mainLabelStack.axis = .vertical
        mainLabelStack.distribution = .fill
        mainLabelStack.alignment = .center
        mainLabelStack.spacing = 5

        recipeNameLabel.text = viewModel.recipeName
        recipeNameLabel.font = .boldSystemFont(ofSize: 40)

        recipeCategoryLabel.text = "Category: \(viewModel.recipeCategory.name!)"
        recipeCategoryLabel.font = .preferredFont(forTextStyle: .title2)

        recipePrepTimeLabel.text = "Prep Time: \(viewModel.recipePrepTime) minutes"
        recipePrepTimeLabel.font = .preferredFont(forTextStyle: .title2)

        subLabelStack.axis = .vertical
        subLabelStack.distribution = .fill
        subLabelStack.alignment = .leading
        subLabelStack.spacing = 20

        recipeDetailsStack.axis = .vertical
        recipeDetailsStack.distribution = .fill
        recipeDetailsStack.alignment = .leading
        recipeDetailsStack.spacing = 5

        detailsLabel.text = "Details"
        detailsLabel.font = .boldSystemFont(ofSize: 22)

        recipeDetailsLabel.text = viewModel.recipeDetails
        recipeDetailsLabel.font = .preferredFont(forTextStyle: .body)
        recipeDetailsLabel.numberOfLines = 0

        recipeIngredientsStack.axis = .vertical
        recipeIngredientsStack.distribution = .fill
        recipeIngredientsStack.alignment = .leading
        recipeIngredientsStack.spacing = 5

        ingredientsLabel.text = "Ingredients"
        ingredientsLabel.font = .boldSystemFont(ofSize: 22)

        recipeIngredientsLabel.text = viewModel.recipeIngredients.joined(separator: ", ")
        recipeIngredientsLabel.font = .preferredFont(forTextStyle: .body)
        recipeIngredientsLabel.numberOfLines = 0

        recipeInstructionsStack.axis = .vertical
        recipeInstructionsStack.distribution = .fill
        recipeInstructionsStack.alignment = .leading
        recipeInstructionsStack.spacing = 5

        instructionsLabel.text = "Instructions"
        instructionsLabel.font = .boldSystemFont(ofSize: 22)

        recipeInstructionsLabel.text = viewModel.recipeInstructions
        recipeInstructionsLabel.font = .preferredFont(forTextStyle: .body)
        recipeInstructionsLabel.numberOfLines = 0
    }

    func layoutViews() {
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: contentStack.frame.size.height)

        view.addSubview(scrollView)
        scrollView.addSubview(contentStack)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        mainLabelStack.translatesAutoresizingMaskIntoConstraints = false
        subLabelStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),

            mainLabelStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            recipeIngredientsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            recipeIngredientsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
        ])
    }
}
