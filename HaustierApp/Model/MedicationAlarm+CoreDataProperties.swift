//
//  MedicationAlarm+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 24.07.23.
//
//

import Foundation
import CoreData


extension MedicationAlarm {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MedicationAlarm> {
        return NSFetchRequest<MedicationAlarm>(entityName: "MedicationAlarm")
    }

    @NSManaged public var day: Int16
    @NSManaged public var hour: Int16
    @NSManaged public var minute: Int16
    @NSManaged public var id: UUID
    @NSManaged public var medication: Medication?

}

extension MedicationAlarm : Identifiable {

}
