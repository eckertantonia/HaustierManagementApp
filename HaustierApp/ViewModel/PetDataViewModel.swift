//
//  PetDataViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData

class PetDataViewModel: NSObject, ObservableObject{
    
    var context: NSManagedObjectContext
    @Published var pet: PetData?
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    
    init(pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        
        let fetchRequest: NSFetchRequest<PetData> = PetData.createFetchRequest()
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
        pet = objects.first(where: {$0.petName == name})
    }
    
    func setPet(pet: PetData) {
        self.pet = pet
    }
    
    func birthdayFormatter() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        guard let formattedString = formatter.string(for: pet?.dateOfBirth) else {
            return ""
        }
        return formattedString
        
    }
}

extension PetDataViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.pet = fetchedResultsController.fetchedObjects?.first
    }
}
