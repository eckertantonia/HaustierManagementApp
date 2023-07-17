//
//  EditFoodIntoleranceVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//

import Foundation
import CoreData

class EditFoodIntoleranceVM: ObservableObject {
    
    var context: NSManagedObjectContext
    
    @Published var foodIntolerance: String
    
    var pet: PetData
    
    init(pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        print("neue Unverträglichkeit")
        self.foodIntolerance = ""
        
    }
    
    func save() {
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
                
                let newIntolerance = FoodIntolerance(context: context)
                newIntolerance.intolerance = foodIntolerance
                newIntolerance.pet = existingPet
                print("exstingPet name \(existingPet.petName)")
                
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
    
}

