//
//  AddEditRecipeTableViewCell+UIPickerViewDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/24/22.
//

import Foundation
import UIKit

extension AddEditRecipeTableViewCell: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCategory = viewModel.categories?[row]
        viewModel.recipeCategory = selectedCategory
    }
}
