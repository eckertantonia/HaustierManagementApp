//
//  Vaccine+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension Vaccine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vaccine> {
        return NSFetchRequest<Vaccine>(entityName: "Vaccine")
    }

    @NSManaged public var disease: String?
    @NSManaged public var recommendedAge: Int64
    @NSManaged public var lastVaccination: Date?
    @NSManaged public var nextVaccination: Date?
    @NSManaged public var pet: PetData?

}

extension Vaccine : Identifiable {

}
