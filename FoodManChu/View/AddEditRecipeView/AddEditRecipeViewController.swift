//
//  AddEditRecipeViewController.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

class AddEditRecipeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }

    func configureViews() {
        view.backgroundColor = .white
        navigationItem.largeTitleDisplayMode = .never
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
        navigationItem.rightBarButtonItem = saveButton
        navigationItem.leftBarButtonItem = cancelButton
    }

    @objc func cancelTapped() {
        dismiss(animated: true)
    }
}
