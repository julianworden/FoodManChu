//
//  ViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Combine
import UIKit

class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()
    var subscribers = Set<AnyCancellable>()

    let tableView = UITableView(frame: CGRect.zero, style: .grouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        //        viewModel.generateExampleRecipe()
        configureSubscribers()
        viewModel.fetchRecipes()
        configureViews()
        layoutViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Recipes"
        navigationItem.largeTitleDisplayMode = .always
        let addRecipeButton = UIBarButtonItem(barButtonSystemItem: .add,
                                              target: self,
                                              action: #selector(addRecipeTapped))
        navigationItem.rightBarButtonItem = addRecipeButton
        navigationItem.leftBarButtonItem = editButtonItem

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RecipeTableViewCell.self, forCellReuseIdentifier: Constants.homeCellReuseIdentifier)
        tableView.backgroundColor = .white
    }

    @objc func addRecipeTapped() {
        let addEditRecipeViewController = AddEditRecipeViewController()
        let addEditRecipeNavigationController = UINavigationController(rootViewController: addEditRecipeViewController)

        addEditRecipeViewController.title = "Add Recipe"
        addEditRecipeViewController.viewModel = AddEditRecipeViewModel(recipeToEdit: nil)
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

// MARK: - Combine

// swiftlint:disable force_cast
extension HomeViewController {
    func configureSubscribers() {
        subscribers = [
            viewModel.$updatedControllerIndexPath
                .sink(receiveValue: { [weak self] indexPath in
                    if let indexPath = indexPath {
                        switch self?.viewModel.controllerChangeType {
                        case .delete:
                            self?.tableView.beginUpdates()
                            self?.tableView.deleteRows(at: [indexPath], with: .none)
                            self?.tableView.endUpdates()
                        case .insert:
                            self?.tableView.insertRows(at: [indexPath], with: .none)
                            self?.tableView.reloadData()

                        case .update:
                            let cell = self?.tableView.cellForRow(at: indexPath) as! RecipeTableViewCell
                            self?.configureCell(cell, indexPath: indexPath)
                            self?.tableView.reloadData()

                        case .move:
                            self?.tableView.insertRows(at: [indexPath], with: .none)
                            self?.tableView.reloadData()

                        default:
                            break
                        }
                    }
                })
        ]
    }
}
