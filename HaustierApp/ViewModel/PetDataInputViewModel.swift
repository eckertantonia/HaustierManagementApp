//
//  PetDataInputViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData

class PetDataInputViewModel: ObservableObject {
    
    @Published var petName: String = ""
    @Published var petBirthDate: Date = Date.init()
    @Published var petGender: String = ""
    @Published var petBreed: String = ""
    @Published var petOrigin: String = ""
    @Published var petWeight: String = ""
    @Published var petHeight: String = ""
    
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func save() {
        do {
            let pet = PetData(context: context)
            pet.petName = petName
            pet.dateOfBirth = petBirthDate
            pet.gender = petGender
            pet.petBreed = petBreed
            pet.placeOfOrigin = petOrigin
            pet.petWeight = Double(petWeight) ?? 0
            pet.petHeight = Double(petHeight) ?? 0
            
            try pet.save()
        } catch {
            print(error)
        }
    }
}
