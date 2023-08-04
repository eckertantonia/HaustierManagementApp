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
        DetailTile(nextPage: AnyView(MedicationDetailView(medication: medication))){
            VStack{
                HStack{
                    Text(medication.wrappedMedicationName)
                    Spacer()
                }
            }
        }
    }
}
