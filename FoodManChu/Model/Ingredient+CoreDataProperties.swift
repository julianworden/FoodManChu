//
//  Ingredient+CoreDataProperties.swift
//  FoodManChu
//
//  Created by Julian Worden on 7/23/22.
//
//

import Foundation
import CoreData

extension Ingredient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ingredient> {
        return NSFetchRequest<Ingredient>(entityName: "Ingredient")
    }

    @NSManaged public var name: String?
    @NSManaged public var isUserCreated: Bool
    @NSManaged public var recipes: NSSet?

}

// MARK: Generated accessors for recipes
extension Ingredient {

    @objc(addRecipesObject:)
    @NSManaged public func addToRecipes(_ value: Recipe)

    @objc(removeRecipesObject:)
    @NSManaged public func removeFromRecipes(_ value: Recipe)

    @objc(addRecipes:)
    @NSManaged public func addToRecipes(_ values: NSSet)

    @objc(removeRecipes:)
    @NSManaged public func removeFromRecipes(_ values: NSSet)

}

extension Ingredient: Identifiable {

}
