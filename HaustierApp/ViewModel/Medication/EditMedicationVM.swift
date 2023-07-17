//
//  EditMedicationVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import Foundation
import CoreData

class EditMedicationVM: ObservableObject {
    
    var context: NSManagedObjectContext
    
    @Published var medicationName: String
    @Published var medicationBrand: String
    @Published var medicationAmount: String
    
    let medication: Medication
    let pet: PetData
    
    init(medication: Medication? = nil, pet: PetData){
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        
        self.medication = medication ?? Medication(context: context)
        self.medicationName = medication?.medication ?? ""
        self.medicationBrand = medication?.medicationBrand ?? ""
        self.medicationAmount = String(medication?.medicationAmount ?? 0)
        
    }
    
    func save(){
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
            
                medication.medication = medicationName
                medication.medicationBrand = medicationBrand
                medication.medicationAmount = Int64(medicationAmount) ?? 0
                medication.pet = pet
                print(medication)
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
}

