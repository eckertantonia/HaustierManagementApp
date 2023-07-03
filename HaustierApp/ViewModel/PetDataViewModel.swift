//
//  PetDataViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData

class PetDataViewModel: ObservableObject {
    
    var context: NSManagedObjectContext
    var pet: PetData?
    
    init() {
        self.context = PersistenceManager.shared.container.viewContext
    }
    
    func setPet(pet: PetData) {
        self.pet = pet
    }
    
    func birthdayFormatter() -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        guard let formattedString = formatter.string(for: pet?.dateOfBirth) else {
            return ""
        }
        return formattedString
        
    }
}
