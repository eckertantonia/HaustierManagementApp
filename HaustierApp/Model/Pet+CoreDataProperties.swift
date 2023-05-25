//
//  Pet+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData


extension Pet {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pet> {
        return NSFetchRequest<Pet>(entityName: "Pet")
    }

    @NSManaged public var food: NSSet?
    @NSManaged public var petData: PetData?
    @NSManaged public var foodIntolerance: NSSet?
    @NSManaged public var diagnosis: NSSet?
    @NSManaged public var medication: NSSet?
    @NSManaged public var vaccines: NSSet?

}

// MARK: Generated accessors for food
extension Pet {

    @objc(addFoodObject:)
    @NSManaged public func addToFood(_ value: Food)

    @objc(removeFoodObject:)
    @NSManaged public func removeFromFood(_ value: Food)

    @objc(addFood:)
    @NSManaged public func addToFood(_ values: NSSet)

    @objc(removeFood:)
    @NSManaged public func removeFromFood(_ values: NSSet)

}

// MARK: Generated accessors for foodIntolerance
extension Pet {

    @objc(addFoodIntoleranceObject:)
    @NSManaged public func addToFoodIntolerance(_ value: FoodIntolerance)

    @objc(removeFoodIntoleranceObject:)
    @NSManaged public func removeFromFoodIntolerance(_ value: FoodIntolerance)

    @objc(addFoodIntolerance:)
    @NSManaged public func addToFoodIntolerance(_ values: NSSet)

    @objc(removeFoodIntolerance:)
    @NSManaged public func removeFromFoodIntolerance(_ values: NSSet)

}

// MARK: Generated accessors for diagnosis
extension Pet {

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
extension Pet {

    @objc(addMedicationObject:)
    @NSManaged public func addToMedication(_ value: Medication)

    @objc(removeMedicationObject:)
    @NSManaged public func removeFromMedication(_ value: Medication)

    @objc(addMedication:)
    @NSManaged public func addToMedication(_ values: NSSet)

    @objc(removeMedication:)
    @NSManaged public func removeFromMedication(_ values: NSSet)

}

// MARK: Generated accessors for vaccines
extension Pet {

    @objc(addVaccinesObject:)
    @NSManaged public func addToVaccines(_ value: Vaccine)

    @objc(removeVaccinesObject:)
    @NSManaged public func removeFromVaccines(_ value: Vaccine)

    @objc(addVaccines:)
    @NSManaged public func addToVaccines(_ values: NSSet)

    @objc(removeVaccines:)
    @NSManaged public func removeFromVaccines(_ values: NSSet)

}

extension Pet : Identifiable {

}
