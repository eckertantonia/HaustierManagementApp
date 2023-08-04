//
//  EditAppointmentVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.07.23.
//

import Foundation
import CoreData
import SwiftUI

class EditAppointmentVM: NSObject, ObservableObject {
    
    @Published var title: String
    @Published var location: String
    @Published var dateBegin: Date
    @Published var dateEnd: Date
    @Published var dateNotification: Date
    @Published var notes: String
    var id: String
    
    var context: NSManagedObjectContext
    var appointment: Appointment?
    var notificationCenter : UNUserNotificationCenter
    
    
    init(appointment: Appointment? = nil, startDate: Date){
        self.context = PersistenceManager.shared.container.viewContext
        self.notificationCenter = UNUserNotificationCenter.current()
        
        self.title = appointment?.title ?? ""
        self.location = appointment?.location ?? ""
        self.dateBegin = startDate
        self.dateEnd = appointment?.appointmentEnd ?? startDate
        self.dateNotification = appointment?.notificationDate ?? startDate
        self.notes = appointment?.notes ?? ""
        self.id = appointment?.id ?? UUID().uuidString

    }
    
    func changeEndTime(){
        dateEnd = Calendar.current.date(byAdding: .hour, value: 1, to: dateBegin) ?? dateEnd
    }
    
    private func authorizeNotifications(){
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted{
                print("notification granted :)")
            } else {
                print("notification problem :(")
            }
        }
    }
    
    private func addNotification(_ appointment: Appointment){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        
        let content = UNMutableNotificationContent()
        content.title = "HaustierApp"
        content.body = "\(appointment.title): "+dateFormatter.string(from: appointment.appointmentStart)
        content.sound = .default
        
        let calendar = Calendar.current
        let dateComps = calendar.dateComponents([.year, .month, .day, .hour, .minute] ,from: dateNotification)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
        
    }
    
    private func removeNotification(_ appointment: Appointment){
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [appointment.id])
        
    }
    
    func delete(){
        let fetchRequest: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingAppointment = results.first {
                context.delete(existingAppointment)
            }
            try context.save()
        } catch {
            print("Error")
        }
        
    }
    
    func save(){
        authorizeNotifications()
        
        let fetchRequest: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingAppointment = results.first {
            
                existingAppointment.title = title
                existingAppointment.location = location
                existingAppointment.appointmentStart = dateBegin
                existingAppointment.appointmentEnd = dateEnd
                existingAppointment.notes = notes
                if existingAppointment.notificationDate != dateNotification {
                    removeNotification(existingAppointment)
                    existingAppointment.notificationDate = dateNotification
                    addNotification(existingAppointment)
                }
                
            } else {
                let newAppointment = Appointment(context: context)
                newAppointment.title = title
                newAppointment.location = location
                newAppointment.appointmentStart = dateBegin
                newAppointment.appointmentEnd = dateEnd
                newAppointment.notificationDate = dateNotification
                newAppointment.notes = notes
                newAppointment.id = id
                
                addNotification(newAppointment)
                
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von Appointment: \(error)")
        }
    }
}
