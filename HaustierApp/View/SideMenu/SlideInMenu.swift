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
                        PetProfileButton(image: "pawprint.fill", title: pet.petName, pet: pet.petData
                        )
                    }.onDelete(perform: deletePetData)
                    
                    // newPet Button
                    CreatePetButton()
                    
                    
                    }
                //.frame(width: .infinity, alignment: .bottomTrailing)
                
            }
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5, alignment: .center)
            .background()
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
