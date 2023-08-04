//
//  Appointment+CoreDataProperties.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.07.23.
//
//

import Foundation
import CoreData


extension Appointment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Appointment> {
        return NSFetchRequest<Appointment>(entityName: "Appointment")
    }

    @NSManaged public var appointmentEnd: Date
    @NSManaged public var appointmentStart: Date
    @NSManaged public var id: String
    @NSManaged public var location: String?
    @NSManaged public var notes: String?
    @NSManaged public var notificationDate: Date
    @NSManaged public var title: String

}

extension Appointment : Identifiable {

}
