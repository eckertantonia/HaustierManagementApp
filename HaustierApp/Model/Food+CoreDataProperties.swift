//
//  Food+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var foodBrand: String?
    @NSManaged public var foodProduct: String?
    @NSManaged public var foodAmount: Float
    @NSManaged public var pet: PetData?

}

extension Food : Identifiable {

}
