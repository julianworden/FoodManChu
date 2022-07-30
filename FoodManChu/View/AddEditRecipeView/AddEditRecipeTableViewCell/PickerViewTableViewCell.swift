//
//  PickerViewTableViewCell.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/26/22.
//

import UIKit

class PickerViewTableViewCell: UITableViewCell {
    var viewModel: AddEditRecipeTableViewCellViewModel!
    let categoryPicker = UIPickerView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // TODO: Keep selectedCategory from disappearing when cell is dequeued
    func addAndConfigureCategoryPicker() {
        viewModel.generateCategories()

        do {
            try viewModel.fetchCategories()
        } catch {
            print(error)
        }

        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        if let recipeToEdit = viewModel.recipeToEdit,
           let categoryIndexPosition = viewModel.categories?.firstIndex(of: recipeToEdit.category!) {
            categoryPicker.selectRow(categoryIndexPosition, inComponent: 0, animated: false)
        } else {
            viewModel.recipeCategory = viewModel.categories?[0]
            categoryPicker.selectRow(0, inComponent: 0, animated: false)
        }

        contentView.addSubview(categoryPicker)

        categoryPicker.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            categoryPicker.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryPicker.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            categoryPicker.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            categoryPicker.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
    }
}
