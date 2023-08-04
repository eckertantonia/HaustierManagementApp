//
//  DiagnosisVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import Foundation
import CoreData

class DiagnosisVM: NSObject, ObservableObject {
    
    var context: NSManagedObjectContext
    @Published var diagnosisArray: [Diagnosis]
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    var pet: PetData
    
    init(pet: PetData){
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        self.diagnosisArray = []
        
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
        self.diagnosisArray = objects.first(where: {$0.petName == name})?.diagnosisArray ?? []
        print("diagnosisArray \(diagnosisArray)")
    }
}

extension DiagnosisVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.diagnosisArray = fetchedResultsController.fetchedObjects?.first?.diagnosisArray ?? []
    }
}
