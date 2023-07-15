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
    
    
//    init(){
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View{
        NavigationStack {
            ScrollView {
                ForEach(profileViewVM.tiles, id: \.self){ title in
                    ProfileViewTile<AnyView>(tileDetails: profileViewVM.tileDetails(tileTitle: title), destinationView: {AnyView(PetDataView(pet: pet, title: title))})
                }
            
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
