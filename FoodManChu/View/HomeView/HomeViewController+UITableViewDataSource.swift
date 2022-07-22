//
//  HomeViewController+UITableViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        // return viewModel.controller.numberOfSections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // viewModel.controller number of rows in given section
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: Constants.homeCellReuseIdentifier)
        tableView.dequeueReusableCell(withIdentifier: Constants.homeCellReuseIdentifier, for: indexPath)

        configureCell(cell, indexPath: indexPath)
        return cell
    }

    func configureCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        var contentConfiguration = cell.defaultContentConfiguration()
        contentConfiguration.text = "Name"
        contentConfiguration.secondaryText = "Category"
        cell.contentConfiguration = contentConfiguration
    }
}
