//
//  CoreDataAccess.swift
//  HaustierApp
//
//  Created by Mobile1 on 12.06.23.
//

import Foundation
import SwiftUI
import CoreData

class CoreController: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
    
    @Published var pets = [PetData]()
    
    private var petFRC: NSFetchedResultsController<PetData>!
    
//    init(moc: NSManagedObjectContext) {
//        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
//        fetchRequest.sortDescriptors = [
//            NSSortDescriptor(keyPath: \PetData.petName, ascending: true)
//        ]
//        petFRC = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: moc, sectionNameKeyPath: nil, cacheName: nil)
//        super.init() // weird but ok?
//        petFRC.delegate = self
//        try? petFRC.performFetch()
//        pets = petFRC.fetchedObjects ?? []
//    }
    
    func loadData(){
        if petFRC == nil {
            let request = PetData.fetchRequest()
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // update list of pets
        if controller == petFRC{
            pets = petFRC.fetchedObjects ?? []
        }
    }
    
    
//    func fetchPets() -> FetchedResults<PetData>{
//        @FetchRequest(sortDescriptors: [
//            SortDescriptor(\.petName)
//        ]) var pets: FetchedResults<PetData>
//
//        return pets
//    }
}
