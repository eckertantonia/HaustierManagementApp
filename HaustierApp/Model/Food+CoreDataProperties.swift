//
//  Food+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var foodAmount: Float
    @NSManaged public var foodBrand: String?
    @NSManaged public var foodProduct: String
    @NSManaged public var foodType: String?
    @NSManaged public var pet: PetData?
    
    public var wrappedFoodBrand: String {
        foodBrand ?? "Unbekannt"
    }
    public var wrappedFoodType: String {
        foodType ?? ""
    }

}

extension Food : Identifiable {

}
