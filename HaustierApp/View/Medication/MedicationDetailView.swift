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
    @ObservedObject var vm: EditMedicationVM
    
    init(medication: Medication){
        self.medication = medication
        self.vm = EditMedicationVM(medication: medication, pet: medication.pet!)
    }
        
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
            HStack{
                VStack{
                    ForEach(vm.selectedDays, id: \.self){ alarm in
                        Text(vm.daysOfWeek[alarm])
                    }
                }
                Text(dateFormatter(vm.selectedTime))
            }
        }
        .sheet(isPresented: $showingEditMedication){
            EditMedicationView(vm: vm)
        }
    }
    
    func dateFormatter(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
}

struct MedicationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MedicationDetailView(medication: Medication())
    }
}
