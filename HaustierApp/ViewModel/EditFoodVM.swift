//
//  EditFoodVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 15.07.23.
//

import Foundation
import CoreData

class EditFoodVM: ObservableObject {
    
    var context: NSManagedObjectContext
    
    @Published var foodBrand: String
    @Published var foodProduct: String
    @Published var foodAmount: String
    
    var food: Food?
    var pet: PetData
    
    init(food: Food? = nil, pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        
        if food != nil {
            print("Du hast ein Food mitgegeben")
            self.foodBrand = food?.foodBrand ?? ""
            self.foodProduct = food?.foodProduct ?? ""
            self.foodAmount = String(food?.foodAmount ?? 0)
            
        } else {
            print("neues Food")
            self.foodBrand = ""
            self.foodProduct = ""
            self.foodAmount = "0"
            
        }
    }
    
    func save() {
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
                
                let newFood = Food(context: context)
                newFood.foodBrand = foodBrand
                newFood.foodProduct = foodProduct
                newFood.foodAmount = Float(foodAmount) ?? 0
                newFood.pet = existingPet
                
            } else {
                
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
    
}
