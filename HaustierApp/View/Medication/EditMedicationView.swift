//
//  EditMedicationView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct EditMedicationView: View {
    @Environment(\.dismiss) var dismiss
     
     @ObservedObject var editMedicationVM: EditMedicationVM
     
     init(vm: EditMedicationVM){
         editMedicationVM = vm
     }
     
     var body: some View {
         Form{
             Section{
                 TextField("Medikament", text: $editMedicationVM.medicationName)
                     .disableAutocorrection(true)
                 TextField("Marke", text: $editMedicationVM.medicationBrand)
                     .disableAutocorrection(true)
                 TextField("Menge (Anzahl Tabletten)", text: $editMedicationVM.medicationAmount)
                     .disableAutocorrection(true)
             }
             Section{
                 Button("Speichern") {
                     editMedicationVM.save()
                     dismiss()
                 }
                 .centerHorizontally()
             }
         }
     }
 }

 struct EditMedicationView_Previews: PreviewProvider {
     static var previews: some View {
         EditDiagnosisView(vm: EditDiagnosisVM(pet: PetData()))
     }
 }
