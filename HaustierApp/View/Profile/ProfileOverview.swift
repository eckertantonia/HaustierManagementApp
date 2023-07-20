//
//  ProfileOverview.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.05.23.
//

import SwiftUI

struct ProfileOverview: View {
    
    var pet: PetData
    let profileViewVM: ProfileViewVM
    
    init(pet: PetData) {
        self.pet = pet
        self.profileViewVM = ProfileViewVM(pet: pet)
    }
    
    
    var body: some View {
        NavigationStack {
            List(profileViewVM.tiles, id: \.self) { title in
                ProfileViewTile<AnyView>(tileDetails: profileViewVM.tileDetails(tileTitle: title), destinationView: {
                    switch title{
                        // petdata
                    case profileViewVM.tiles[0]:
                        return AnyView(PetDataView(pet: pet, title: title))
                        // food
                    case profileViewVM.tiles[1]:
                        return AnyView(FoodView(pet: pet, title: title))
                        // diagnosen
                    case profileViewVM.tiles[2]:
                        return AnyView(DiagnosisView(pet: pet, title: title))
                        // medikamente
                    case profileViewVM.tiles[3]:
                        return AnyView(MedicationView(pet: pet, title: title))
                        // impfungen
                    case profileViewVM.tiles[4]:
                        return AnyView(VaccineView(pet: pet, title: title))
                        // default
                    default:
                        return AnyView(PetDataView(pet: pet, title: title))
                    }
                })
            }
            .navigationBarTitle(pet.petName, displayMode: .inline)
        }
        
    }
}

struct ProfileOverview_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOverview(pet: PetData())
    }
}
