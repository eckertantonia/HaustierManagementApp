//
//  PetDataView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

// mit ViewModel arbeiten

struct PetDataView: View {
    var body: some View {
        NavigationView {
            Text("Pet Data")
                .navigationBarTitle("PetData", displayMode: .inline)
                .toolbar{
                    NavigationLink(destination: PetDataInputView()){
                        Text("Edit")
                    }
                }
        }
        
    }
}

struct PetDataView_Previews: PreviewProvider {
    static var previews: some View {
        PetDataView()
    }
}
