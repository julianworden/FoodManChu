//
//  IngredientSelectionViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import UIKit

class IngredientSelectionViewController: UIViewController {
    let viewModel = IngredientSelectionViewModel()

    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()

//        viewModel.generateIngredients()
        viewModel.fetchIngredients()
        configureViews()
        layoutViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Ingredients"
        let addIngredientButton = UIBarButtonItem(barButtonSystemItem: .add, target: nil, action: nil)
        navigationItem.rightBarButtonItem = addIngredientButton

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IngredientTableViewViewCell.self, forCellReuseIdentifier: Constants.ingredientCellReuseIdentifier)
        tableView.allowsMultipleSelection = true
        tableView.allowsMultipleSelectionDuringEditing = true
    }

    func layoutViews() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
