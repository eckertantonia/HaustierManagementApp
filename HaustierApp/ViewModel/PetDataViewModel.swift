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
    
    func savePetData(name: String, gender: String){
        
        let pet = PetData(context: context)
        pet.petName = name
        pet.gender = gender
        PersistenceController.shared.save() // saving after creating new object to save to Persistence Container
    }
    
}
