//
//  Persistence.swift
//  HaustierApp
//
//  Created by Mobile1 on 18.05.23.
//

import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()
    
    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let previewController = PersistenceController(inMemory: true)
        let viewContext = previewController.container.viewContext
        // Create 10 example PetData
        for _ in 0..<10 {
            let newPet = PetData(context: viewContext)
            newPet.petName = "Paul"
            newPet.gender = "male"
        }
        
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return previewController
    }()

    // An initializer to load Core Data, optionally able to use an in-memory store
    init(inMemory: Bool = false) {
        // name is Data Model name (mine is called DataModel)
        container = NSPersistentContainer(name: "DataModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
                print("context save error: \(error.localizedDescription)")
            }
        }
    }
}
