//
//  AddEditRecipeViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Combine
import Foundation
import UIKit

class AddEditRecipeViewController: UIViewController {
    var viewModel: AddEditRecipeViewModel! {
        didSet {
            configureViews()
            layoutViews()
        }
    }
    var newRecipeNameSubscriber: AnyCancellable?
    var newRecipeDetailsSubscriber: AnyCancellable?
    var newRecipeInstructionsSubscriber: AnyCancellable?
    var newRecipePrepTimeSubscriber: AnyCancellable?
    var newRecipeCategorySubscriber: AnyCancellable?
    var newRecipeIngredientsSubscriber: AnyCancellable?

    let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func configureViews() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTapped))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TextFieldTableViewCell.self,
                           forCellReuseIdentifier: Constants.textFieldCellReuseIdentifier)
        tableView.register(TextViewTableViewCell.self,
                           forCellReuseIdentifier: Constants.textViewCellReuseIdentifier)
        tableView.register(PickerViewTableViewCell.self,
                           forCellReuseIdentifier: Constants.pickerViewCellReuseIdentifier)
        tableView.register(LabelTableViewCell.self,
                           forCellReuseIdentifier: Constants.labelCellReuseIdentifier)
        tableView.register(LabelWithNavigationTableViewCell.self,
                           forCellReuseIdentifier: Constants.labelWithNavigationCellReuseIdentifier)
        tableView.keyboardDismissMode = .interactive
    }

    @objc func saveTapped() {
        viewModel.saveRecipe()
        dismiss(animated: true)
    }

    @objc func cancelTapped() {
        dismiss(animated: true)
    }
}

// MARK: - Constraints

extension AddEditRecipeViewController {
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
