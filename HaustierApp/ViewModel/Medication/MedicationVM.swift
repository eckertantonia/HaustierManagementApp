//
//  MedicationVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import Foundation
import CoreData

class MedicationVM: NSObject, ObservableObject {
    
    var context: NSManagedObjectContext
    @Published var medicationArray: [Medication]
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    private var pet: PetData
    
    init(pet: PetData){
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        self.medicationArray = []
        
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
        self.medicationArray = objects.first(where: {$0.petName == name})?.medicationArry ?? []
    }
}

extension MedicationVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.medicationArray = fetchedResultsController.fetchedObjects?.first?.medicationArry ?? []
        print("petname \(fetchedResultsController.fetchedObjects?.first?.petName)")
        print("medicationArray \(medicationArray)")
    }
}

