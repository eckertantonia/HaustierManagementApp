//
//  PetData+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.07.23.
//
//

import Foundation
import CoreData


extension PetData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PetData> {
        return NSFetchRequest<PetData>(entityName: "PetData")
    }

    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var gender: String
    @NSManaged public var petBreed: String?
    @NSManaged public var petHeight: Double
    @NSManaged public var petName: String
    @NSManaged public var petWeight: Double
    @NSManaged public var placeOfOrigin: String?
    @NSManaged public var profilePicture: Data?
    @NSManaged public var diagnosis: NSSet?
    @NSManaged public var food: NSSet?
    @NSManaged public var foodIntolerance: NSSet?
    @NSManaged public var medication: NSSet?
    @NSManaged public var vaccine: NSSet?
    
    // NSSet muss in Set<> konvertiert werden, sonst kann man damit nix anfangen
    public var foodArray: [Food] {
        let set = food as? Set<Food> ?? []
        return set.sorted {
            $0.foodProduct < $1.foodProduct
        }
    }
    
    public var intoleranceArray: [FoodIntolerance] {
        let set = foodIntolerance as? Set<FoodIntolerance> ?? []
        return set.sorted {
            $0.intolerance < $1.intolerance
        }
    }
    
    public var diagnosisArray: [Diagnosis] {
        let set = diagnosis as? Set<Diagnosis> ?? []
        return set.sorted {
            $0.wrappedDescription < $1.wrappedDescription
        }
    }
    
    public var medicationArry: [Medication] {
        let set = medication as? Set<Medication> ?? []
        return set.sorted {
            $0.wrappedMedicationName < $1.wrappedMedicationName
        }
    }
    
    public var vaccineArray: [Vaccine] {
        let set = vaccine as? Set<Vaccine> ?? []
        return set.sorted {
            $0.disease < $1.disease
        }
    }

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

extension PetData : Identifiable {

}
