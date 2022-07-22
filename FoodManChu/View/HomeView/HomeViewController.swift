//
//  ViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import UIKit

class HomeViewController: UIViewController {

    let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        layoutViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Recipes"
        navigationItem.largeTitleDisplayMode = .always
        let addRecipeButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addRecipeTapped))
        navigationItem.rightBarButtonItem = addRecipeButton

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.homeCellReuseIdentifier)
    }

    @objc func addRecipeTapped() {
        let addEditRecipeViewController = AddEditRecipeViewController()
        addEditRecipeViewController.title = "Add Recipe"

        let addEditRecipeNavigationController = UINavigationController(rootViewController: addEditRecipeViewController)
        present(addEditRecipeNavigationController, animated: true)
    }
}

// MARK: - Constraints

extension HomeViewController {
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

