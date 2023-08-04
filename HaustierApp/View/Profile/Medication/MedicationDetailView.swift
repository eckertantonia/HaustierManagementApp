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
        DetailView(pet: vm.pet, pageTitle: medication.wrappedMedicationName, sheet: AnyView(EditMedicationView(vm: vm))){
            CustomLabeledContent(label: "Medikament", value: medication.wrappedMedicationName)
            CustomLabeledContent(label: "Marke", value: medication.wrappedMedicationBrand)
            HStack{
                CustomLabeledContent(label: "Menge", value: String(medication.medicationAmount))
                if medication.medicationAmount == 1 {
                    Text("Tablette")
                } else {
                    Text("Tablette")
                }
            }
            HStack{
                CustomLabeledContent(label: "Erinnerung", value: "")
                VStack{
                    if vm.medication.notificationArray.count > 0 {
                        ForEach(vm.selectedDays, id: \.self){ alarm in
                            Text(vm.daysOfWeek[alarm])
                                .darkgreenText()
                        }
                        Text(dateFormatter(vm.selectedTime))
                    } else {
                        Text(" - ")
                            .darkgreenText()
                    }
                }

            }
            
        }
    }
    
    func dateFormatter(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: date)
    }
    
}
