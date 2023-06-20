//
//  ProfileOverview.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.05.23.
//

import SwiftUI

struct ProfileOverview: View {
    
    var pet: PetData
    
    init(pet: PetData) {
        self.pet = pet
    }
    
    
//    init(){
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View{
        NavigationView {
            ScrollView {
                OverviewTile(petAttribute: "Pet Data")
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
