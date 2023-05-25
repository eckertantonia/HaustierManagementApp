//
//  PetData+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension PetData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetData> {
        return NSFetchRequest<PetData>(entityName: "PetData")
    }

    @NSManaged public var petName: String?
    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var genderMale: Bool
    @NSManaged public var genderFemale: Bool
    @NSManaged public var petBreed: String?
    @NSManaged public var placeOfOrigin: String?
    @NSManaged public var petWeight: Double
    @NSManaged public var petHeight: Double

}

extension PetData : Identifiable {

}
