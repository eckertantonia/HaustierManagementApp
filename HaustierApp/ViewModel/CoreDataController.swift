//
//  CoreDataController.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.06.23.
//

import Foundation
import UIKit
import CoreData

class CoreDataController:NSObject, NSFetchedResultsControllerDelegate {
//    var container: NSPersistentContainer!
//    var fetchedResultsController: NSFetchedResultsController<PetData>!
    var context: NSManagedObjectContext
    
    var pets: [PetData]
    
    init( context: NSManagedObjectContext) {
        self.context = context
        self.pets = [PetData]()
    }
    
//    override func viewDidLoad(){
//        super.viewDidLoad()
//
//        container = NSPersistentContainer(name: "DataModel")
//        print("Context \(container.viewContext)")
//        container.loadPersistentStores { storeDescription, error in
//            if let error = error {
//                print("unresolved error \(error)")
//            }
//
//
//        }
//        loadSavedData()
//    }
    
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
        
        let request = PetData.createFetchRequest()
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
    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?){
//        switch type {
//        case .update:
//            loadSavedData()
//        default:
//            break
//        }
//    }
}
