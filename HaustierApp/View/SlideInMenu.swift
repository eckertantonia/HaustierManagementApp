//
//  SlideInMenu.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct SlideInMenu: View {
    @Environment(\.managedObjectContext) var moc
    
    @State var pets = [PetData]()
   
    
    
        var body: some View {
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(pets, id: \.self){ pet in
                        PetProfileButton(image: "pawprint.fill", title: pet.petName, pet: pet )
                    }
                    
                    // newPet Button
                    CreatePetButton()
                    
                    
                    }
                //.frame(width: .infinity, alignment: .bottomTrailing)
                
            }
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5, alignment: .center)
            .background()
            .opacity(1) // TODO when Colors are chosen
            .padding(32)
            .onAppear{
                pets = CoreDataController(context: moc).loadSavedData()
            }
        }
    }


struct SlideInMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideInMenu()
    }
}
