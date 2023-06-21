//
//  PetDataInputView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//


import SwiftUI

struct RadioButton: View {
    
    @State var buttonValue: Bool
    var label: String
    
    init(label: String, value: Bool = false){
        self.label = label
        self.buttonValue = value
    }
    
    
    var body: some View {
        
        HStack{
            Button(action: { buttonValue.toggle() }, label: {
                Text("   ")
                    .frame(width: 30, height: 30)
                    .cornerRadius(100)
                    .foregroundColor(.black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 100)
                        .stroke(.black, lineWidth: 6)
                        .scaleEffect(0.6)
                    )
                Text(label)
            })
        }
    }
    
    
}
