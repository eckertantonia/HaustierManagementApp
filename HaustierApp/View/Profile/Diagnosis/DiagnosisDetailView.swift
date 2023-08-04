//
//  DiagnosisDetailView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct DiagnosisDetailView: View {
    @ObservedObject var diagnosis: Diagnosis
    @State var showingEditDiagnosis = false
        
    var body: some View {
        DetailView(pet: diagnosis.pet!, pageTitle: diagnosis.wrappedDescription, sheet: AnyView(EditDiagnosisView(vm: EditDiagnosisVM(diagnosis: diagnosis,pet: diagnosis.pet!)))) {
            CustomLabeledContent(label: "Bezeichnung", value: diagnosis.wrappedDescription)
            CustomLabeledContent(label: "Datum", value: dateFormatter())
            CustomLabeledContent(label: "Tierarzt", value: diagnosis.wrappedVeterinarian)
            CustomLabeledContent(label: "Notizen", value: diagnosis.wrappedNotes)
        }
    }
    
    func dateFormatter() -> String{
            let formatter = DateFormatter()
            formatter.dateStyle = .long
        guard let formattedString = formatter.string(for: diagnosis.diagnosisDate) else {
                return ""
            }
            return formattedString
            
        }
}
