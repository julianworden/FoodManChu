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
    static let addEditRecipeCellReuseIdentifier = "AddEditRecipeCell"
    static let ingredientCellReuseIdentifier = "IngredientCell"
}
