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
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let managedObjectContext = appDelegate.persistentContainer.viewContext

    static let homeCellReuseIdentifier = "HomeCell"
    static let textFieldCellReuseIdentifier = "TextFieldCell"
    static let textViewCellReuseIdentifier = "TextViewCell"
    static let pickerViewCellReuseIdentifier = "PickerViewCell"
    static let labelCellReuseIdentifier = "LabelCell"
    static let labelWithNavigationCellReuseIdentifier = "LabelWithNavigationCell"
    static let ingredientCellReuseIdentifier = "IngredientCell"

    static let ingredientChosenNotificationKey = "IngredientsChosen"
    static let ingredientChosenNotification = Notification.Name(ingredientChosenNotificationKey)
    static let notifyIngredientCellNotificationKey = "NotifyIngredientCell"
    static let notifyIngredientCellNotification = Notification.Name(notifyIngredientCellNotificationKey)
    static let reloadIngredientsListNotificationKey = "ReloadIngredientsList"
    static let reloadIngredientsListNotification = Notification.Name(reloadIngredientsListNotificationKey)
}
