//
//  ProfileViewVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import Foundation
import SwiftUI

class ProfileViewVM: ObservableObject {
    
    let pet: PetData
    let tiles: [String]
    
    init(pet: PetData) {
        self.pet = pet
        self.tiles = ["Tierdaten", "Futter", "Diagnosen", "Medikamente", "Impfungen"]
    }
    
    func tileDetails(tileTitle: String) -> [String]{
        var tileDetails = [String]()
        
        switch tileTitle{
        case tiles[0]:
            // Tierdaten
            // add Details
            tileDetails.append(pet.petName)
            tileDetails.append(pet.petBreed ?? "unbekannt") // breed is not necessarily known
            if pet.dateOfBirth != nil {
                let now = Date()
                let calendar = Calendar.current
                let ageComp = calendar.dateComponents([.year], from: pet.dateOfBirth!, to: now)
                let petAge = ageComp.year!
                tileDetails.append(String(petAge)+" Jahr(e) alt")
            }
        case tiles[1]:
            // Futter
            break
        case tiles[2]:
            //Diagnose
            // Anzahl Diagnosen
            if pet.diagnosisArray.count == 1 {
                tileDetails.append(String(pet.diagnosisArray.count)+" Diagnose")
            } else if pet.diagnosisArray.count == 0 {
                tileDetails.append("keine Diagnosen")
            } else {
                tileDetails.append(String(pet.diagnosisArray.count)+" Diagnosen")
            }
            
        case tiles[3]:
            // Medikamente
            // Anzahl Medikamente
            if pet.medicationArry.count == 1 {
                tileDetails.append(String(pet.medicationArry.count)+" Medikament")
            } else if pet.medicationArry.count == 0 {
                tileDetails.append("keine Medikamente")
            } else {
                tileDetails.append(String(pet.medicationArry.count)+" Medikamente")
            }
            
        case tiles[4]:
            // Impfungen
            // TODO
            break
        default:
            break
        }
       
        return tileDetails
    }
}
