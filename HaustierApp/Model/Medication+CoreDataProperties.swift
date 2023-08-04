//
//  Medication+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 04.08.23.
//
//

import Foundation
import CoreData


extension Medication {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Medication> {
        return NSFetchRequest<Medication>(entityName: "Medication")
    }

    @NSManaged public var medication: String?
    @NSManaged public var medicationAlarm: Bool
    @NSManaged public var medicationAmount: Int64
    @NSManaged public var medicationBrand: String?
    @NSManaged public var medicationDays: String?
    @NSManaged public var medicationFrequency: Int64
    @NSManaged public var notification: NSSet?
    @NSManaged public var pet: PetData?
    
    public var wrappedMedicationName: String {
        medication ?? ""
    }
    
    public var wrappedMedicationBrand: String {
        medicationBrand ?? "Unbekannt"
    }

    public var notificationArray: [MedicationAlarm] {
        get {
            let set = notification as? Set<MedicationAlarm> ?? []
            return set.sorted {
                $0.id < $1.id
            }
        }
        set {
            notification = NSSet(array: newValue) as NSSet
        }
        
    }

}

// MARK: Generated accessors for notification
extension Medication {

    @objc(addNotificationObject:)
    @NSManaged public func addToNotification(_ value: MedicationAlarm)

    @objc(removeNotificationObject:)
    @NSManaged public func removeFromNotification(_ value: MedicationAlarm)

    @objc(addNotification:)
    @NSManaged public func addToNotification(_ values: NSSet)

    @objc(removeNotification:)
    @NSManaged public func removeFromNotification(_ values: NSSet)

}

extension Medication : Identifiable {

}
