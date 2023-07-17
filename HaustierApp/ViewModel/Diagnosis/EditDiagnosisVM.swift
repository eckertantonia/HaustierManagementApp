//
//  EditDiagnosisVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import Foundation
import CoreData

class EditDiagnosisVM: ObservableObject {
    
    var context: NSManagedObjectContext
    
    @Published var diagnosisDescription: String
    @Published var diagnosisDate: Date
    @Published var veterinarian: String
    @Published var diagnosisNotes: String
    
    let diagnosis: Diagnosis
    let pet: PetData
    
    init(diagnosis: Diagnosis? = nil, pet: PetData){
        self.context = PersistenceManager.shared.container.viewContext
        self.pet = pet
        
        self.diagnosis = diagnosis ?? Diagnosis(context: context)
        self.diagnosisDescription = diagnosis?.diagnosisDescription ?? ""
        self.diagnosisDate = diagnosis?.diagnosisDate ?? Date.init()
        self.veterinarian = diagnosis?.veterinarian ?? ""
        self.diagnosisNotes = diagnosis?.diagnosisNotes ?? ""
        
//        if diagnosis != nil {
//            print("diagnose mitgegeben")
//            self.diagnosis = diagnosis!
//            self.diagnosisDescription = diagnosis?.diagnosisDescription
//            self.diagnosisDate = diagnosis?.diagnosisDate
//            self.veterinarian = diagnosis?.veterinarian
//            self.diagnosisNotes = diagnosis?.diagnosisNotes
//            print(diagnosis)
//        } else {
//
//        }
    }
    
    func save(){
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", pet.petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
            
                diagnosis.diagnosisDescription = diagnosisDescription
                diagnosis.diagnosisDate = diagnosisDate
                diagnosis.veterinarian = veterinarian
                diagnosis.diagnosisNotes = diagnosisNotes
                diagnosis.pet = pet
                print(diagnosis)
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
}
