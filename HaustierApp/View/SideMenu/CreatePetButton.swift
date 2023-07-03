//
//  CreatePetButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct CreatePetButton: View {
    
    var body: some View {
        NavigationLink(destination: PetDataInputView(vm: PetDataInputViewModel(context: PersistenceManager.shared.container.viewContext))){
            VStack{
                // Pic
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                //Padding top for Top Close Button
                    //.padding(.top, 50)
                Text("neu")
                    .font(.title3)
                    .padding(.top)
                
            }
            .padding([.leading, .trailing])
        }
        .padding()
    }
}

struct CreatePetButton_Previews: PreviewProvider {
    static var previews: some View {
        CreatePetButton()
    }
}
