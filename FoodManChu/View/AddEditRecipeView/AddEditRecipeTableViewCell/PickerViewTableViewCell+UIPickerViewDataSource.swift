//
//  AddEditRecipeTableViewCell+UIPickerViewDataSource.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/24/22.
//

import Foundation
import UIKit

extension PickerViewTableViewCell: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let category = viewModel.categories?[row]
        return category?.name
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let categories = viewModel.categories {
            return categories.count
        } else {
            return 1
        }
    }
}
