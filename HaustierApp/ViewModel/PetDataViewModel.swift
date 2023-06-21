//
//  PetDataViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.06.23.
//

import Foundation
import CoreData

class PetDataViewModel {
    
    var context: NSManagedObjectContext
    var coreDataController: CoreDataController

    init(context: NSManagedObjectContext) {
        self.context = context
        self.coreDataController = CoreDataController(context: context)
    }
    
    func savePetData(name: String,dateOfBirth: Date, gender: String, breed: String, origin: String, weight: String, height: String ){
        if coreDataController.checkIfNameExists(name: name){
            let pet = PetData(context: context)
            pet.petName = name
            pet.dateOfBirth = dateOfBirth
            pet.gender = gender
            pet.petBreed = breed
            pet.placeOfOrigin = origin
            // default value if input was nil
            pet.petWeight = Double(weight) ?? 0
            pet.petHeight = Double(height) ?? 0
            
            PersistenceController.shared.save() // saving after creating new object to save to Persistence Container
            print("saved pet: \n \(pet)")
        } else {
            print("Pet already exists")
        }
        
    }
    
}
