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
    let tileTitleList: [String]
    
    init(pet: PetData) {
        self.pet = pet
        self.tileTitleList = ["Tierdaten", "Futter", "Diagnosen", "Medikamente", "Impfungen"]
        self.profileViewVM = ProfileViewVM(pet: pet, tiles: tileTitleList)
    }
    
    
//    init(){
//        UITabBar.appearance().isHidden = true
//    }
    
    var body: some View{
        NavigationView {
            ScrollView {
                ForEach(tileTitleList, id: \.self){ title in
                    ProfileViewTile<AnyView>(tileDetails: profileViewVM.tileDetails(tileTitle: title), destinationView: {AnyView(PetDataView())})
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
