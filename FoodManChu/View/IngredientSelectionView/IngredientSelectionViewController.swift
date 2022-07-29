//
//  IngredientSelectionViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Combine
import CoreData
import UIKit

class IngredientSelectionViewController: UIViewController {
    var viewModel: IngredientSelectionViewModel!
    var fetchedResultsController: NSFetchedResultsController<Ingredient>?
    var subscribers = Set<AnyCancellable>()

    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.generateIngredients()
        viewModel.fetchIngredients()
        configureViews()
        layoutViews()
        configureSubscribers()
    }

    func configureViews() {
        view.backgroundColor = .white
        title = "Ingredients"
        let addIngredientButton = UIBarButtonItem(barButtonSystemItem: .add,
                                                  target: self,
                                                  action: #selector(addIngredientButtonTapped))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItems = [doneButton, addIngredientButton]
        navigationItem.leftBarButtonItem = editButtonItem

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(IngredientTableViewCell.self,
                           forCellReuseIdentifier: Constants.ingredientCellReuseIdentifier)
    }

    @objc func addIngredientButtonTapped() {
        navigationController?.pushViewController(AddIngredientViewController(), animated: true)
    }

    @objc func doneButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension IngredientSelectionViewController {
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
extension IngredientSelectionViewController {
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
                            let cell = self?.tableView.cellForRow(at: indexPath) as! IngredientTableViewCell
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
