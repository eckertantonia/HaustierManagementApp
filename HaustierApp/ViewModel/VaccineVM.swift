//
//  VaccineVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.07.23.
//

import Foundation
import CoreData
import SwiftUI

class VaccineVM: NSObject,  ObservableObject {
    var JSONvaccines: [JSONVaccine]
    
    var context: NSManagedObjectContext
    @Published var vaccineArray: [Vaccine]
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    var pet: PetData
    
    init(pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        self.vaccineArray = []
        self.JSONvaccines = VaccineJSONService().vaccines
        print(" Json vaccines \(JSONvaccines)")
        
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
                fetchRequest.sortDescriptors = [NSSortDescriptor(key: "petName", ascending: true)]
                
                fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
                
                super.init()
                
                fetchedResultsController.delegate = self
                
                do {
                    try fetchedResultsController.performFetch()
                } catch {
                    print("Failed to perform fetch: \(error)")
                }
                
                fetchObject(withName: pet.petName)
    }
    
    func fetchObject(withName name: String){
        guard let objects = fetchedResultsController.fetchedObjects else {
            return
        }
        self.vaccineArray = objects.first(where: {$0.petName == name})?.vaccineArray ?? []
    }
    
    func isToggled(for vaccine: JSONVaccine) -> Binding<Bool> {
        
        Binding<Bool>(
            get: { self.vaccineArray.contains {$0.disease == vaccine.disease} },
            set: { isSelected in
                if isSelected {
                    self.save(jsonVaccine: vaccine)
                } else {
                    self.deleteVaccine(disease: vaccine.disease)
                }
            }
        )
    }
    
    private func save(jsonVaccine: JSONVaccine) {
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName = %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
                let vaccine = Vaccine(context: context)
                vaccine.disease = jsonVaccine.disease
                vaccine.recommendedAge = jsonVaccine.recommendedAge
//                vaccine.nextVaccination = vaccine.lastVaccination + jsonVaccine.protectedPeriod
                vaccine.notes = jsonVaccine.notes
                vaccine.pet = pet
                print(vaccine)
            }
            try context.save()
            
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
    
    private func deleteVaccine(disease: String) {
            let request: NSFetchRequest<Vaccine> = Vaccine.fetchRequest()
            request.predicate = NSPredicate(format: "disease == %@", disease)
            
            do {
                let vaccines = try context.fetch(request)
                if let vaccineToDelete = vaccines.first {
                    context.delete(vaccineToDelete)
                    try context.save()
                }
            } catch {
                print("Fehler beim Löschen des Impfstoffs: \(error.localizedDescription)")
            }
        }
    
    
}

extension VaccineVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.vaccineArray = fetchedResultsController.fetchedObjects?.first?.vaccineArray ?? []
        print("petname \(fetchedResultsController.fetchedObjects?.first?.petName)")
        print("foodArray \(vaccineArray)")
    }
}
