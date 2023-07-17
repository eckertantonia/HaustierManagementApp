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
        NavigationStack{
            VStack{
                HStack{
                    Text(title)
                        .font(.title)
                        .padding()
                    Spacer()
                    Button (
                        action:{
                            showingAddDiagnosis.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        }
                        
                    )
                    .padding()
                }
                
                diagnosisList
            }
            .sheet(isPresented: $showingAddDiagnosis){
                EditDiagnosisView(vm: EditDiagnosisVM(pet: pet))
//                EmptyView()
            }
            
            
        }
        
    }
}

extension DiagnosisView {
    
    var diagnosisList: some View {
        List{
            ForEach(diagnosisVM.diagnosisArray, id: \.self) { diagnosis in
                DiagnosisTile(diagnosis: diagnosis)
            }
        }
    }
}

//struct DiagnosisView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnosisView()
//    }
//}
