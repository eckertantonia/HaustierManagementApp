//
//  FoodIntolerance+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension FoodIntolerance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodIntolerance> {
        return NSFetchRequest<FoodIntolerance>(entityName: "FoodIntolerance")
    }

    @NSManaged public var intolerance: String?
    @NSManaged public var pet: PetData?

}

extension FoodIntolerance : Identifiable {

}
