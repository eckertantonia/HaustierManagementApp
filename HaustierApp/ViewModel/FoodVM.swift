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
    @Published var intolerance: FoodIntolerance?
    
    private let fetchedResultsController: NSFetchedResultsController<PetData>
    
    init(pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.foodArray = []
        
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
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
        print("foodArray \(foodArray.count)")
//        foodArray = pet?.foodArray ?? []
//        intolerance = pet?.foodIntolerance
    }
    
//    func setPet(pet: PetData) {
//        self.pet = pet
//    }
    
//    func birthdayFormatter() -> String{
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        guard let formattedString = formatter.string(for: pet?.dateOfBirth) else {
//            return ""
//        }
//        return formattedString
//
//    }
}

extension FoodVM: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.foodArray = fetchedResultsController.fetchedObjects?.first?.foodArray ?? []
    }
}

