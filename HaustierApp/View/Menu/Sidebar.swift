//
//  Sidebar.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.07.23.
//

import SwiftUI

struct Sidebar: View {
    
    @Binding var isVisible : Bool
    var sideBarWidth = UIScreen.main.bounds.size.width*0.7
    var sideBarHeight = UIScreen.main.bounds.size.height*0.4
    var bgColor: Color = Color.accentColor
    
    @ObservedObject private var sidebarVM = SidebarViewModel(context: PersistenceManager.shared.container.viewContext)
    
    var body: some View {
        ZStack{
            GeometryReader{ _ in
                EmptyView()
            }
            .background(.black.opacity(0.6))
            .opacity(isVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.2), value: isVisible)
            .onTapGesture {
                isVisible.toggle()
            }
            content
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var content: some View {

        HStack(alignment: .top){
            ZStack(alignment: .top){
                Color.custom.backgroundColor
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(sidebarVM.pets, id: \.self){ pet in
                            PetProfileButton(pet: pet.petData, pictureData: pet.pictureData)
                        }
                        
                        
                        // newPet Button
                        CreatePetButton()
                    }
                }
                .padding(.top, 80)
                .padding(.horizontal, 40)
            }
            .frame(width: sideBarWidth)
            .offset(x: isVisible ? UIScreen.main.bounds.size.width-sideBarWidth : UIScreen.main.bounds.size.width)
//            .offset(x: UIScreen.main.bounds.size.width-sideBarWidth)
                .animation(.default, value: isVisible)
            Spacer()
        }
    }
}

//struct Sidebar_Previews: PreviewProvider {
//    static var previews: some View {
//        Sidebar()
//    }
//}
