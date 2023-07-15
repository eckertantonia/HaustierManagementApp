//
//  CoreDataController.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.06.23.
//

import Foundation
import UIKit
import CoreData

class CoreDataService:NSObject, NSFetchedResultsControllerDelegate, ObservableObject {
//    var container: NSPersistentContainer!
//    var fetchedResultsController: NSFetchedResultsController<PetData>!
    var context: NSManagedObjectContext
    
    @Published var pets: [PetData]
    
    init( context: NSManagedObjectContext) {
        self.context = context
        self.pets = [PetData]()
    }
    
//    func saveContext () {
//        if container.viewContext.hasChanges{
//            do {
//                try container.viewContext.save()
//            } catch {
//                print("An error occured while saving \(error)")
//            }
//        }
//    }
    
    func loadSavedData() -> [PetData] {
        
        let request = PetData.fetchRequest()
        let sort = NSSortDescriptor(key: "petName", ascending: false)
        request.sortDescriptors = [sort]
//        if fetchedResultsController == nil {
//            fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: container.viewContext, sectionNameKeyPath: nil, cacheName: nil)
//            fetchedResultsController.delegate = self
//        }
        
        do {
//            try fetchedResultsController.performFetch()
            pets = try context.fetch(request)
            print("Got \(pets.count) PetData Objects")
        } catch {
            print("Fetch failed")
            
        }
        return pets
    }
    
    func checkIfNameExists(name: String) -> Bool {
//        print(pets)
        for pet in loadSavedData() {
            print("cur pet \(pet.petName) -> \(name)")
            if pet.petName == name{
                return false
            }
        }
        
        return true
    }
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
//        switch type {
//        case .update:
//            loadSavedData()
//        default:
//            break
//        }
//    }
}
