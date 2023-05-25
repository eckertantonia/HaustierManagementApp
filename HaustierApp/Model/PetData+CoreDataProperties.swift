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
    @NSManaged public var food: NSSet?
    @NSManaged public var diagnosis: NSSet?
    @NSManaged public var medication: NSSet?
    @NSManaged public var vaccine: NSSet?
    @NSManaged public var foodIntolerance: NSSet?

}

// MARK: Generated accessors for food
extension PetData {

    @objc(addFoodObject:)
    @NSManaged public func addToFood(_ value: Food)

    @objc(removeFoodObject:)
    @NSManaged public func removeFromFood(_ value: Food)

    @objc(addFood:)
    @NSManaged public func addToFood(_ values: NSSet)

    @objc(removeFood:)
    @NSManaged public func removeFromFood(_ values: NSSet)

}

// MARK: Generated accessors for diagnosis
extension PetData {

    @objc(addDiagnosisObject:)
    @NSManaged public func addToDiagnosis(_ value: Diagnosis)

    @objc(removeDiagnosisObject:)
    @NSManaged public func removeFromDiagnosis(_ value: Diagnosis)

    @objc(addDiagnosis:)
    @NSManaged public func addToDiagnosis(_ values: NSSet)

    @objc(removeDiagnosis:)
    @NSManaged public func removeFromDiagnosis(_ values: NSSet)

}

// MARK: Generated accessors for medication
extension PetData {

    @objc(addMedicationObject:)
    @NSManaged public func addToMedication(_ value: Medication)

    @objc(removeMedicationObject:)
    @NSManaged public func removeFromMedication(_ value: Medication)

    @objc(addMedication:)
    @NSManaged public func addToMedication(_ values: NSSet)

    @objc(removeMedication:)
    @NSManaged public func removeFromMedication(_ values: NSSet)

}

// MARK: Generated accessors for vaccine
extension PetData {

    @objc(addVaccineObject:)
    @NSManaged public func addToVaccine(_ value: Vaccine)

    @objc(removeVaccineObject:)
    @NSManaged public func removeFromVaccine(_ value: Vaccine)

    @objc(addVaccine:)
    @NSManaged public func addToVaccine(_ values: NSSet)

    @objc(removeVaccine:)
    @NSManaged public func removeFromVaccine(_ values: NSSet)

}

// MARK: Generated accessors for foodIntolerance
extension PetData {

    @objc(addFoodIntoleranceObject:)
    @NSManaged public func addToFoodIntolerance(_ value: FoodIntolerance)

    @objc(removeFoodIntoleranceObject:)
    @NSManaged public func removeFromFoodIntolerance(_ value: FoodIntolerance)

    @objc(addFoodIntolerance:)
    @NSManaged public func addToFoodIntolerance(_ values: NSSet)

    @objc(removeFoodIntolerance:)
    @NSManaged public func removeFromFoodIntolerance(_ values: NSSet)

}

extension PetData : Identifiable {

}
