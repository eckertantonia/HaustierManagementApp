//
//  Diagnosis+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension Diagnosis {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Diagnosis> {
        return NSFetchRequest<Diagnosis>(entityName: "Diagnosis")
    }

    @NSManaged public var diagnosisDescription: String?
    @NSManaged public var diagnosisDate: Date?
    @NSManaged public var veterinarian: String?
    @NSManaged public var diagnosisNotes: String?
    @NSManaged public var pet: PetData?

}

extension Diagnosis : Identifiable {

}
