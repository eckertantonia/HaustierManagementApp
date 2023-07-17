//
//  EditDiagnosisView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct EditDiagnosisView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var editDiagnosisVM: EditDiagnosisVM
    
    init(vm: EditDiagnosisVM){
        editDiagnosisVM = vm
    }
    
    var body: some View {
        Form{
            Section{
                TextField("Bezeichnung", text: $editDiagnosisVM.diagnosisDescription)
                    .disableAutocorrection(true)
                DatePicker(selection: $editDiagnosisVM.diagnosisDate, in: ...Date.now, displayedComponents: .date){
                    Text("Datum")
                }
                TextField("Tierarzt", text: $editDiagnosisVM.veterinarian)
                    .disableAutocorrection(true)
                TextEditor(text: $editDiagnosisVM.diagnosisNotes)
                    .padding(.horizontal)
            }
            Section{
                Button("Speichern") {
                    editDiagnosisVM.save()
                    dismiss()
                }
                .centerHorizontally()
            }
        }
    }
}

struct EditDiagnosisView_Previews: PreviewProvider {
    static var previews: some View {
        EditDiagnosisView(vm: EditDiagnosisVM(pet: PetData()))
    }
}
