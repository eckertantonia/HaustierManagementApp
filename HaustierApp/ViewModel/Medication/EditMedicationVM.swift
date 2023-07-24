//
//  EditMedicationVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import Foundation
import CoreData
import SwiftUI

class EditMedicationVM: ObservableObject {
    
    var context: NSManagedObjectContext
    
    @Published var medicationName: String
    @Published var medicationBrand: String
    @Published var medicationAmount: String
    
    @Published var selectedDays = [Int]()
    @Published var selectedTime: Date = Date()
    @Published var addAlarm: Bool
    @Published var isRepeatOn = false
    
    let daysOfWeek = ["","Sonntag","Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag", "Samstag"]
    
    let medication: Medication
    let pet: PetData
    let notificationCenter : UNUserNotificationCenter
    
    init(medication: Medication? = nil, pet: PetData){
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        self.notificationCenter = UNUserNotificationCenter.current()
        
        self.medication = medication ?? Medication(context: context)
        self.medicationName = medication?.medication ?? ""
        self.medicationBrand = medication?.medicationBrand ?? ""
        self.medicationAmount = String(medication?.medicationAmount ?? 0)
        self.addAlarm = medication?.medicationAlarm ?? false
        if ((medication?.notificationArray.isEmpty) != nil) {
            var comps = DateComponents()
            comps.hour = Int(medication!.notificationArray[0].hour)
            comps.minute = Int(medication!.notificationArray[0].minute)
            self.selectedTime = Calendar.current.date(from: comps)!
            self.isRepeatOn = true

            for alarm in medication!.notificationArray {
                self.selectedDays.append(Int(alarm.day))

            }
        }
        
        authorizeNotifications()
        
    }
    
    func toggleDay(_ day: Int) -> Binding<Bool> {
        Binding<Bool>(
            get: { self.selectedDays.contains(day) },
            set: { isOn in
                if isOn {
                    self.selectedDays.append(day)
                } else {
                    if let index = self.selectedDays.firstIndex(of: day){
                        self.selectedDays.remove(at: index)
                    }
                }
            }
        )
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
    
    private func addNotification(_ alarm: MedicationAlarm){
        let content = UNMutableNotificationContent()
        content.title = "HaustierApp"
        content.body = "\(pet.petName) braucht jetzt \(medicationName)!"
        content.sound = .default
        
        var dateComps = DateComponents()
        dateComps.hour = Int(alarm.hour)
        dateComps.minute = Int(alarm.minute)
        dateComps.weekday = Int(alarm.day)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComps, repeats: true)
        
        let request = UNNotificationRequest(identifier: alarm.id.uuidString, content: content, trigger: trigger)
        notificationCenter.add(request)
        
    }
    
    private func removeNotification(_ alarms: [MedicationAlarm]){
        
        for alarm in alarms {
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [alarm.id.uuidString])
        }
        
    }
    
    func save(){
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
            
                medication.medication = medicationName
                medication.medicationBrand = medicationBrand
                medication.medicationAmount = Int64(medicationAmount) ?? 0
                medication.pet = pet
                medication.medicationAlarm = addAlarm
                var alarms = [MedicationAlarm]()
                if addAlarm {
                    
                    for day in selectedDays{
                        var alarm = MedicationAlarm(context: context)
                        alarm.medication = medication
                        var dateComps = Calendar(identifier: .gregorian).dateComponents([.hour, .minute], from: selectedTime)
                        alarm.day = Int16(day)
                        alarm.hour = Int16(dateComps.hour!)
                        alarm.minute = Int16(dateComps.minute!)
                        alarm.id = UUID()
                        alarms.append(alarm)
                        addNotification(alarm)
                    }
                }
                medication.notificationArray = alarms
                print(medication)
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
}

