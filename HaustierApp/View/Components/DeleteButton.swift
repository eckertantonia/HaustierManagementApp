//
//  DeleteButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct DeleteButton: View {
    
    var deleteFunc : () -> Void
    var dismiss : DismissAction
    
    var body: some View {
        Section{
            Button("Löschen") {
                deleteFunc()
                dismiss()
            }
            
            .centerHorizontally()
        }
        .listRowBackground(Color.custom.burntOrange)
        .foregroundColor(.white)
    }
}
