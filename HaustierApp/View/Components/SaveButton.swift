//
//  SaveButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct SaveButton: View {
    
    var saveFunc : () -> Void
    var dismiss : DismissAction
    
    var body: some View {
        Section{
            Button("Speichern") {
                saveFunc()
                dismiss()
            }
            .centerHorizontally()
            
        }
        .listRowBackground(Color.custom.burntOrange)
        .foregroundColor(.white)
    }
}
