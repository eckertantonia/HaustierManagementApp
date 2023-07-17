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
    @Published var foodType: String
    var foodTypes = ["Trockenfutter", "Nassfutter"]
    
    let food: Food
    var pet: PetData
    
    init(food: Food? = nil, pet: PetData) {
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        
        if food != nil {
            print("Du hast ein Food mitgegeben")
            self.food = food!
            self.foodBrand = food?.foodBrand ?? ""
            self.foodProduct = food?.foodProduct ?? ""
            self.foodAmount = String(food?.foodAmount ?? 0)
            self.foodType = food?.foodType ?? ""
            print(food)
            
        } else {
            print("neues Food")
            self.food = Food(context: context)
            self.foodBrand = ""
            self.foodProduct = ""
            self.foodAmount = "0"
            self.foodType = ""
            
        }
    }
    
    func save() {
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
            
                food.foodBrand = foodBrand
                food.foodProduct = foodProduct
                food.foodAmount = Float(foodAmount) ?? 0
                food.foodType = foodType
                food.pet = existingPet
                print(food)
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
    
}
