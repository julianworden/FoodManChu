//
//  User.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/28/22.
//

import Foundation

struct User {
    static var shared = User()

    var hasGeneratedIngredients = false
    var hasGeneratedRecipeCategories = false
}
