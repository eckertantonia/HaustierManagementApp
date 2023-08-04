//
//  MedicationView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct MedicationView: View {
    
    @ObservedObject var medicationVM: MedicationVM
    
    @State var showingAddMedication = false
    
    var pet: PetData
    var title: String
    
    init(pet: PetData, title: String){
        self.pet = pet
        self.title = title
        self.medicationVM = MedicationVM(pet: pet)
    }
    
    
    var body: some View {
        CustomNavigationView{
            VStack{
                HStack{
                    Spacer()
                    Button (
                        action:{
                            showingAddMedication.toggle()
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
                medicationList
            }
            .navigationTitle(title)
            .sheet(isPresented: $showingAddMedication){
                EditMedicationView(vm: EditMedicationVM(pet: pet))
            }
        }
        .pet(pet: medicationVM.pet)
    }
}

extension MedicationView {
    
    var medicationList: some View {
        CustomListe {
            ForEach(medicationVM.medicationArray, id: \.self) { medication in
                MedicationTile(medication: medication)
            }
            if medicationVM.medicationArray.isEmpty{
                Spacer()
            }
            
        }
    }
}
