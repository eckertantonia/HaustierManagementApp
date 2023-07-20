//
//  Vaccine+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.07.23.
//
//

import Foundation
import CoreData


extension Vaccine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Vaccine> {
        return NSFetchRequest<Vaccine>(entityName: "Vaccine")
    }

    @NSManaged public var disease: String
    @NSManaged public var lastVaccination: Date?
    @NSManaged public var nextVaccination: Date?
    @NSManaged public var recommendedAge: String?
    @NSManaged public var notes: String?
    @NSManaged public var selected: Bool
    @NSManaged public var pet: PetData?

}

extension Vaccine : Identifiable {

}
