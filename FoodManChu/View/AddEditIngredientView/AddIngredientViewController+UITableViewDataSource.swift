//
//  AddIngredientViewController+UITableViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/27/22.
//

import Foundation
import UIKit

extension AddIngredientViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.addIngredientCellReuseIdentifier,
            for: indexPath
        ) as? AddIngredientTableViewCell {
            newIngredientSubscriber = cell.viewModel.$ingredientName
                .sink(receiveValue: { [weak self] ingredientName in
                    if let ingredientName = ingredientName {
                        self?.viewModel.ingredientName = ingredientName
                    }
                })
            return cell
        } else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}
