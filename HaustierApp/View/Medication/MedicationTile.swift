//
//  MedicationTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct MedicationTile: View {
    var medication: Medication
        
        var body: some View {
            NavigationLink(destination: {
                MedicationDetailView(medication: medication)
            }, label: {
                VStack{
                    HStack{
                        Text(medication.medication)
                        Spacer()
                    }
                }
            })
        }
}

struct MedicationTile_Previews: PreviewProvider {
    static var previews: some View {
        MedicationTile(medication: Medication())
    }
}
