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
        InputForm(title: "Diagnose") {
            CustomTextFieldSection(title: "Bezeichnung", text: $editDiagnosisVM.diagnosisDescription)
            Section{
                HStack{
                    Spacer()
                    DatePicker(selection: $editDiagnosisVM.diagnosisDate, in: ...Date.now, displayedComponents: .date){
                        Text("Datum")
                            .labelsHidden()
                    }
                    Spacer()
                }
            } header: {
                Text("Diagnostiziert am")
                    .darkgreenText()
                    .font(.body)
            }
            CustomTextFieldSection(title: "Tierarzt", text: $editDiagnosisVM.veterinarian)
            Section {
                TextEditor(text: $editDiagnosisVM.diagnosisNotes)
                    .padding(.horizontal)
                    .frame(minHeight: 100)
            } header: {
                Text("Notizen")
            }
            SaveButton(saveFunc: editDiagnosisVM.save, dismiss: dismiss)
        }
    }
}

struct EditDiagnosisView_Previews: PreviewProvider {
    static var previews: some View {
        EditDiagnosisView(vm: EditDiagnosisVM(pet: PetData()))
    }
}
