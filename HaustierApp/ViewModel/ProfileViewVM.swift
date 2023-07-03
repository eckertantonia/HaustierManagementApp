//
//  ProfileViewVM.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import Foundation

class ProfileViewVM {
    
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
            // add Tile Title
            tileDetails.append(tiles[0])
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
            // add Tile Title
            tileDetails.append(tiles[1])
            // TODO
            
        case tiles[2]:
            //Diagnose
            // add Tile Title
            tileDetails.append(tiles[2])
            // TODO
        case tiles[3]:
            // Medikamente
            // add Tile Title
            tileDetails.append(tiles[3])
            //TODO
        case tiles[4]:
            // Impfungen
            // add Tile Title
            tileDetails.append(tiles[4])
            // TODO
        default:
            break
        }
       
        return tileDetails
    }
}
