//
//  AddEditIngredientViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/27/22.
//

import Combine
import UIKit

class AddIngredientViewController: UIViewController {
    var viewModel = AddIngredientViewModel()
    var newIngredientSubscriber: AnyCancellable?

    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
        layoutViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        navigationItem.rightBarButtonItem = saveButton

        tableView.register(AddIngredientTableViewCell.self,
                           forCellReuseIdentifier: Constants.addIngredientCellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    @objc func saveTapped() {
        viewModel.saveIngredient()
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - Constraints

extension AddIngredientViewController {
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
