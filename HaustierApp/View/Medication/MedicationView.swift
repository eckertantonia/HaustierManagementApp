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
        NavigationStack{
            VStack{
                HStack{
                    Text(title)
                        .font(.title)
                        .padding()
                    Spacer()
                    Button (
                        action:{
                            showingAddMedication.toggle()
                        }, label: {
                            Image(systemName: "plus")
                        }                    )
                    .padding()
                }
                medicationList
            }
            .sheet(isPresented: $showingAddMedication){
                EditMedicationView(vm: EditMedicationVM(pet: pet))
            }
            
            
        }
        
    }
}

extension MedicationView {
    
    var medicationList: some View {
        List{
            ForEach(medicationVM.medicationArray, id: \.self) { medication in
                MedicationTile(medication: medication)
            }
        }
    }
}

//struct Medication_Previews: PreviewProvider {
//    static var previews: some View {
//        MedicationView()
//    }
//}
