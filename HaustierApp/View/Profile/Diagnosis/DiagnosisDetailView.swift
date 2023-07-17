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
            VStack{
                HStack{
                    Text(diagnosis.diagnosisDescription)
                        .font(.title)
                        .padding()
                    Spacer()
                    Button (
                        action:{
                            showingEditDiagnosis.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        }
                        
                    )
                    .padding()
                }
                HStack{
                    Text("Bezeichnung")
                    Text(diagnosis.diagnosisDescription)
                }
                .padding()
                HStack{
                    Text("Datum")
                    Text(dateFormatter())
                }
                .padding()
                HStack{
                    Text("Tierarzt")
                    Text(diagnosis.wrappedVeterinarian)
                }
                .padding()
                VStack{
                    Text("Notizen")
                    Text(String(diagnosis.wrappedNotes))
                }
                .padding()
            }
            .sheet(isPresented: $showingEditDiagnosis){
                EditDiagnosisView(vm: EditDiagnosisVM(diagnosis: diagnosis,pet: diagnosis.pet!))
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

struct DiagnosisDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DiagnosisDetailView(diagnosis: Diagnosis())
    }
}
