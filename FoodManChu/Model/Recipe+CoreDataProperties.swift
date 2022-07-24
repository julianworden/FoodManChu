//
//  Recipe+CoreDataProperties.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/22/22.
//
//

import Foundation
import CoreData

extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var details: String?
    @NSManaged public var instructions: String?
    @NSManaged public var name: String?
    @NSManaged public var prepTime: Int16
    @NSManaged public var category: Category?
    @NSManaged public var ingredients: NSSet?

}

// MARK: Generated accessors for ingredients
extension Recipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

extension Recipe: Identifiable {

}
