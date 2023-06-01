//
//  SlideInMenu.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct SlideInMenu: View {
        var protoText: [String]
        var body: some View {
            
            ScrollView(.horizontal) {
                HStack{
                    ForEach(protoText, id: \.self){ proto in
                        
                        NavigationLink(destination: Text("probe")){
                            PetProfileButton(image: "pawprint.fill", title: proto)
                        }
                    }
                    
                    // newPet Button
                    CreatePetButton()
                    
                    
                    }
                //.frame(width: .infinity, alignment: .bottomTrailing)
                
            }
            //.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5, alignment: .center)
            .background(.white)
            .padding(32)
        }
    }


struct SlideInMenu_Previews: PreviewProvider {
    static var previews: some View {
       SlideInMenu(protoText: ["pawprint"])
    }
}
