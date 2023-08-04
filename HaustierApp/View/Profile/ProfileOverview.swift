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
    @State var tileDetails: [String]
    
    init(pet: PetData) {
        self.pet = pet
        self.profileViewVM = ProfileViewVM(pet: pet)
        self.tileDetails = [String]()
    }
    
    
    var body: some View {
        CustomNavigationView{
            VStack{
                ForEach(profileViewVM.tiles, id: \.self) { title in
                    NavigationLink(destination: {
                        switch title{
                            // petdata
                        case profileViewVM.tiles[0]:
                            AnyView(PetDataView(pet: pet, title: title))
                            // food
                        case profileViewVM.tiles[1]:
                            AnyView(FoodView(pet: pet, title: title))
                            // diagnosen
                        case profileViewVM.tiles[2]:
                            AnyView(DiagnosisView(pet: pet, title: title))
                            // medikamente
                        case profileViewVM.tiles[3]:
                            AnyView(MedicationView(pet: pet, title: title))
                            // impfungen
                        case profileViewVM.tiles[4]:
                            AnyView(VaccineView(pet: pet, title: title))
                            // default
                        default:
                            AnyView(PetDataView(pet: pet, title: title))
                        }
                    },
                                   label: {
                        ProfileViewTile(title: title, vm: profileViewVM)
                    })
                }
                .listStyle(.plain)
                .padding(.all, 5)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.custom.backgroundColor)
                .navigationBarTitle(pet.petName, displayMode: .inline)
            }
        }
        .pet(pet: pet)
    }
}


