//
//  MedicationDetailView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct MedicationDetailView: View {
    @ObservedObject var medication: Medication
    @State var showingEditMedication = false
        
    var body: some View {
        VStack{
            HStack{
                Text(medication.medication)
                    .font(.title)
                    .padding()
                Spacer()
                Button (
                    action:{
                        showingEditMedication.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }
                    
                )
                .padding()
            }
            HStack{
                Text("Medikament")
                Text(medication.medication)
            }
            .padding()
            HStack{
                Text("Marke")
                Text(medication.wrappedMedicationBrand)
            }
            .padding()
            HStack{
                Text("Menge")
                Text(String(medication.medicationAmount))
                Text("Tabletten")
            }
            .padding()
        }
        .sheet(isPresented: $showingEditMedication){
            EditMedicationView(vm: EditMedicationVM(medication: medication, pet: medication.pet!))
        }
    }
}

struct MedicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetailView(medication: Medication())
    }
}
