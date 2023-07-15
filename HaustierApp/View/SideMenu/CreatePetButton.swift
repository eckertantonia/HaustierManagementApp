//
//  CreatePetButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct CreatePetButton: View {
    
    @State private var showingInputScreen = false
    
    var body: some View {
        
        Button {
            showingInputScreen.toggle()
        } label: {
            VStack{
                Image(systemName: "plus.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                Text("neu")
                    .font(.title3)
                    .padding(.top)
                
            }
            
        }
        .padding([.leading, .trailing])
        .sheet(isPresented: $showingInputScreen){
                PetDataInputView(vm: PetDataInputViewModel())
    }
    }
}

struct CreatePetButton_Previews: PreviewProvider {
    static var previews: some View {
        CreatePetButton()
    }
}
