//
//  FoodVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 15.07.23.
//


import Foundation
import CoreData
import UIKit

class FoodVM: NSObject, ObservableObject{
    
    var context: NSManagedObjectContext
    @Published var foodArray: [Food]
    @Published var intoleranceArray: [FoodIntolerance]
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    private var pet: PetData
    
    init(pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        self.foodArray = []
        self.intoleranceArray = []
        
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
        self.foodArray = objects.first(where: {$0.petName == name})?.foodArray ?? []
        self.intoleranceArray = objects.first(where: {$0.petName == name})?.intoleranceArray ?? []
    }
    
}

extension FoodVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.foodArray = fetchedResultsController.fetchedObjects?.first?.foodArray ?? []
        self.intoleranceArray = fetchedResultsController.fetchedObjects?.first?.intoleranceArray ?? []
        print("petname \(fetchedResultsController.fetchedObjects?.first?.petName)")
        print("foodArray \(foodArray)")
        print("intoleranceArray \(intoleranceArray)")
    }
}

