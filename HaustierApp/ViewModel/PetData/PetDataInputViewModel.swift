//
//  PetDataInputViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData
import _PhotosUI_SwiftUI

class PetDataInputViewModel: ObservableObject {
    
    @Published var selectedPicture: UIImage?
    @Published var petPicture: PhotosPickerItem?
    @Published var pictureData: Data?
    @Published var petName: String
    @Published var petBirthDate: Date
    @Published var petGender: String
    @Published var petBreed: String
    @Published var petOrigin: String
    @Published var petWeight: String
    @Published var petHeight: String
    
    let genderList = ["männlich", "weiblich"]
    
    var context: NSManagedObjectContext
    
    var pet: PetData?
    
    init(pet: PetData? = nil) {
        self.context = PersistenceManager.shared.container.viewContext
            self.petName = pet?.petName ?? ""
            self.petBirthDate = pet?.dateOfBirth ?? Date.init()
            self.petGender = pet?.gender ?? genderList[0]
            self.petBreed = pet?.petBreed ?? ""
            self.petOrigin = pet?.placeOfOrigin ?? ""
            if pet?.petWeight != nil {
                self.petWeight = String(pet!.petWeight)
            } else {
                self.petWeight = ""
            }
            if pet?.petHeight != nil {
                self.petHeight = String(pet!.petHeight)
            } else {
                self.petHeight = ""
            }
            if let imageData = pet?.profilePicture {
                if let uiImage = UIImage(data: imageData) {
                    self.selectedPicture = uiImage
                }
            }
    }
    
    func save() {
        let fetchRequest: NSFetchRequest<PetData> = PetData.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "petName == %@", petName)
        
        do {
            let results = try context.fetch(fetchRequest)
            if let existingPet = results.first {
                existingPet.petName = petName
                existingPet.dateOfBirth = petBirthDate
                existingPet.gender = petGender
                existingPet.petBreed = petBreed
                existingPet.placeOfOrigin = petOrigin
                existingPet.petWeight = Double(petWeight) ?? 0
                existingPet.petHeight = Double(petHeight) ?? 0
                if let image = selectedPicture {
                    existingPet.profilePicture = image.pngData()
                }
                
            } else {
                if petName != "" {
                    let pet = PetData(context: context)
                    pet.petName = petName
                    pet.dateOfBirth = petBirthDate
                    pet.gender = petGender
                    pet.petBreed = petBreed
                    pet.placeOfOrigin = petOrigin
                    pet.petWeight = Double(petWeight) ?? 0
                    pet.petHeight = Double(petHeight) ?? 0
                    if let image = selectedPicture {
                        pet.profilePicture = image.pngData()
                    }
                }
                
            }
            try context.save()
        } catch let error as NSError {
            print("Fehler beim Updaten/abspeichern von PetData: \(error)")
        }
    }
}
    

