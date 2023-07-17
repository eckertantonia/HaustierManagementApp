//
//  Diagnosis+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//
//

import Foundation
import CoreData


extension Diagnosis {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Diagnosis> {
        return NSFetchRequest<Diagnosis>(entityName: "Diagnosis")
    }

    @NSManaged public var diagnosisDate: Date?
    @NSManaged public var diagnosisDescription: String
    @NSManaged public var diagnosisNotes: String?
    @NSManaged public var veterinarian: String?
    @NSManaged public var pet: PetData?
    
    public var wrappedVeterinarian: String {
        veterinarian ?? ""
    }
    
    public var wrappedNotes: String {
        diagnosisNotes ?? ""
    }
    
}

extension Diagnosis : Identifiable {

}
