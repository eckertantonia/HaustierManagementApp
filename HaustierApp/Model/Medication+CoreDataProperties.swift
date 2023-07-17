//
//  Medication+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//
//

import Foundation
import CoreData


extension Medication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medication> {
        return NSFetchRequest<Medication>(entityName: "Medication")
    }

    @NSManaged public var medication: String
    @NSManaged public var medicationAlarm: Bool
    @NSManaged public var medicationAmount: Int64
    @NSManaged public var medicationBrand: String?
    @NSManaged public var medicationDays: String?
    @NSManaged public var medicationFrequency: Int64
    @NSManaged public var pet: PetData?

}

extension Medication : Identifiable {

}
