//
//  SlideInMenuViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData

@MainActor
class SlideInMenuViewModel: NSObject, ObservableObject {
    
    @Published var pets = [PetViewModel]()
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: PetData.all, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let pets = fetchedResultsController.fetchedObjects else {
                return
            }
            self.pets = pets.map(PetViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func deletePetData (petId: NSManagedObjectID) {
        do {
            guard let pet = try context.existingObject(with: petId) as? PetData else {
                return
            }
            try pet.delete()
        } catch {
            print(error)
        }
    }
    
}

extension SlideInMenuViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        guard let pets = controller.fetchedObjects as? [PetData] else {
            return
        }
        self.pets = pets.map(PetViewModel.init)
    }
}

struct PetViewModel: Identifiable, Hashable {
    
    var petData: PetData
    
    init(pet: PetData){
        self.petData = pet
    }
    
    var id: NSManagedObjectID {
        petData.objectID
    }
    
    var petName: String {
        petData.petName
    }
    
    var pictureData: Data? {
        petData.profilePicture
    }
}
