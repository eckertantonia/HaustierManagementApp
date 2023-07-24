//
//  SlideInMenu.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct SlideInMenu: View {
    @Environment(\.managedObjectContext) var moc
    
    @ObservedObject private var slideInMenuVM: SlideInMenuViewModel
    
    init(vm: SlideInMenuViewModel) {
        self.slideInMenuVM = vm
    }
    
    private func deletePetData(at offsets: IndexSet) {
        offsets.forEach{ index in
            let pet = slideInMenuVM.pets[index]
            slideInMenuVM.deletePetData(petId: pet.id)
        }
    }
        var body: some View {
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(slideInMenuVM.pets, id: \.self){ pet in
                        PetProfileButton(pet: pet.petData, pictureData: pet.pictureData)
                    }.onDelete(perform: deletePetData)
                    
                    // newPet Button
                    CreatePetButton()
                    
                    
                    }
                
            }
            .background(Color.ui.backgroundColor)
            .opacity(1) // TODO when Colors are chosen
            .padding(32)
        }
    }


struct SlideInMenu_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceManager.shared.container.viewContext
        SlideInMenu(vm: SlideInMenuViewModel(context: viewContext))
    }
}
