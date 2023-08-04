//
//  CalendarVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.07.23.
//

import Foundation
import CoreData

class CalendarVM: NSObject, ObservableObject {
    
    @Published var pets: [PetData]
    var appointments: [Appointment]
    @Published var appointmentsDict : [Date: [Appointment]]
    
    
    var context: NSManagedObjectContext
    private let fetchedResultsControllerPets: NSFetchedResultsController<PetData>
    private let fetchedResultsControllerAppointments: NSFetchedResultsController<Appointment>
    
    override init(){
        self.context = PersistenceManager.shared.container.viewContext
        self.pets = []
        self.appointments = []
        self.appointmentsDict = [:]
        
        let fetchRequestPets: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequestPets.sortDescriptors = [NSSortDescriptor(key: "petName", ascending: true)]
        
        fetchedResultsControllerPets = NSFetchedResultsController(fetchRequest: fetchRequestPets, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        let fetchRequestAppointments: NSFetchRequest<Appointment> = Appointment.fetchRequest()
        fetchRequestAppointments.sortDescriptors = [NSSortDescriptor(key: "appointmentStart", ascending: true)]
        
        fetchedResultsControllerAppointments = NSFetchedResultsController(fetchRequest: fetchRequestAppointments, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        super.init()
        
        fetchedResultsControllerPets.delegate = self
        fetchedResultsControllerAppointments.delegate = self
        
        do {
            try fetchedResultsControllerPets.performFetch()
            try fetchedResultsControllerAppointments.performFetch()
        } catch {
            print("Failed to perform fetch: \(error)")
        }
        
        self.pets = fetchedResultsControllerPets.fetchedObjects ?? []
        self.appointments = fetchedResultsControllerAppointments.fetchedObjects ?? []
        
        fillAppointmentsDict()
    }
    
    private func fillAppointmentsDict () {
        
        appointmentsDict = [:]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        for appointment in appointments {
            if Calendar.current.isDateInToday(appointment.appointmentStart) || appointment.appointmentStart > Date.now {
                let date = dateFormatter.date(from: dateFormatter.string(from: appointment.appointmentStart)) ?? Date()
                
                if var ap = appointmentsDict[date] {
                    ap.append(appointment)
                    appointmentsDict[date] = ap
                } else {
                    appointmentsDict[date] = [appointment]
                }
            }
            
            
        }
        
    }
    
    
}

extension CalendarVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.pets = fetchedResultsControllerPets.fetchedObjects ?? []
        self.appointments = fetchedResultsControllerAppointments.fetchedObjects ?? []
        fillAppointmentsDict()
    }
}
