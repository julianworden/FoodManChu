//
//  Constants.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//

import Foundation
import UIKit

// swiftlint:disable force_cast
struct Constants {
    // Core Data
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let managedObjectContext = appDelegate.persistentContainer.viewContext

    // Cell Reuse Identifiers
    static let homeCellReuseIdentifier = "HomeCell"
    static let textFieldCellReuseIdentifier = "TextFieldCell"
    static let textViewCellReuseIdentifier = "TextViewCell"
    static let pickerViewCellReuseIdentifier = "PickerViewCell"
    static let labelCellReuseIdentifier = "LabelCell"
    static let labelWithNavigationCellReuseIdentifier = "LabelWithNavigationCell"
    static let ingredientCellReuseIdentifier = "IngredientCell"
    static let addIngredientCellReuseIdentifier = "AddEditIngredientCell"

    // Notifications
    static let ingredientChosenNotificationKey = "IngredientsChosen"
    static let ingredientChosenNotification = Notification.Name(ingredientChosenNotificationKey)

    // UserDefaults
    static let userHasGeneratedCategoriesKey = "UserHasGeneratedCategories"
    static let userHasGeneratedIngredientsKey = "UserHasGeneratedIngredients"
}
