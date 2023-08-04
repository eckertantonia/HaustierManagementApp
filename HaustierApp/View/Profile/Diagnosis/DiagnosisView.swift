//
//  DiagnosisView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct DiagnosisView: View {
    
    @ObservedObject var diagnosisVM: DiagnosisVM
    
    @State var showingAddDiagnosis = false
    
    var pet: PetData
    var title: String
    
    init(pet: PetData, title: String){
        self.pet = pet
        self.title = title
        self.diagnosisVM = DiagnosisVM(pet: pet)
    }
    
    
    var body: some View {
        CustomNavigationView{
            VStack{
                HStack{
                    Spacer()
                    Button (
                        action:{
                            showingAddDiagnosis.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 20, height: 20)
                                .tint(Color.custom.darkGreen)
                        }
                        
                    )
                    .padding()
                }
                .padding(.horizontal, 10)
                
                diagnosisList
            }
            .navigationBarTitle(title, displayMode: .inline)
            .sheet(isPresented: $showingAddDiagnosis){
                EditDiagnosisView(vm: EditDiagnosisVM(pet: pet))
            }
            
            
        }
        .pet(pet: diagnosisVM.pet)
        
    }
}

extension DiagnosisView {
    
    var diagnosisList: some View {
        CustomListe{
            ForEach(diagnosisVM.diagnosisArray, id: \.self) { diagnosis in
                DiagnosisTile(diagnosis: diagnosis)
            }
            if diagnosisVM.diagnosisArray.isEmpty {
                Spacer()
            }
        }
    }
}
