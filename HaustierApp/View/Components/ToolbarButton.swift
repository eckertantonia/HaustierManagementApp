//
//  ToolbarButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.07.23.
//

import SwiftUI

struct ToolbarButton: View{
    
    @Binding var showMenu : Bool
    var pet: PetData?
    var buttonSize: CGFloat = 30
    
    var body: some View {
        Button(action: {
            showMenu.toggle()
        }, label: {
            if let picture = pet?.profilePicture {
                Label{
                    Text(pet!.petName)
                } icon: {
                    Image(uiImage: UIImage(data: picture)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: buttonSize, height: buttonSize)
                        .cornerRadius(20)
                        
                }
            } else {
                Label("Toggle Sidebar", systemImage: "pawprint.fill")
                    .foregroundColor(Color.custom.darkGreen)
                    .cornerRadius(20)
                    .frame(width: buttonSize, height: buttonSize)
            }
            
        })
    }
}
