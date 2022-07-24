//
//  RecipeTableViewCellButtonDelegate.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//

import Foundation

protocol RecipeTableViewCellButtonDelegate: AnyObject {
    func recipeTableViewCell(_ cell: RecipeTableViewCell, editButtonWasTapped: Bool)
    func receipeTableViewCell(_ cell: RecipeTableViewCell, detailsButtonWasTapped: Bool)
}
