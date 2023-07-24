//
//  EditMedicationView.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct EditMedicationView: View {
    @Environment(\.dismiss) var dismiss
     
    @ObservedObject var editMedicationVM: EditMedicationVM
    @State var showToggleDays = false
     
     init(vm: EditMedicationVM){
         editMedicationVM = vm
     }
     
     var body: some View {
         Form{
             Section{
                 VStack{
                     HStack{
                         Text("Medikament")
                         Spacer()
                     }
                     TextField("", text: $editMedicationVM.medicationName)
                         .disableAutocorrection(true)
                 }
                 VStack{
                     HStack{
                         Text("Marke")
                         Spacer()
                     }
                     TextField("", text: $editMedicationVM.medicationBrand)
                         .disableAutocorrection(true)
                 }
                 
                 VStack{
                     HStack{
                         Text("Menge")
                         Spacer()
                     }
                     HStack{
                         TextField("", text: $editMedicationVM.medicationAmount)
                             .disableAutocorrection(true)
                         Text("Tablette(n)")
                     }
                 }
                 
                 
                 
                 Toggle(isOn: $editMedicationVM.addAlarm, label: {
                     Text("Wecker")
                 })
                 
                 if editMedicationVM.addAlarm {
                     alarmSetting
                 }
                 
             }
             Section{
                 Button("Speichern") {
                     editMedicationVM.save()
                     dismiss()
                 }
                 .centerHorizontally()
             }

         }
     }
 }

extension EditMedicationView {
    var alarmSetting: some View {
        Group {
            Section{
                DatePicker("Erinnerungszeit", selection: $editMedicationVM.selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .frame(height: UIScreen.main.bounds.height/4)
            }
            
                    
            Section {
                Toggle("Wiederholen", isOn: $editMedicationVM.isRepeatOn)
                if editMedicationVM.isRepeatOn {
                    VStack {
                        ForEach(1..<editMedicationVM.daysOfWeek.count, id: \.self) { index in
                            Toggle(isOn: editMedicationVM.toggleDay(index)) {
                                Text(editMedicationVM.daysOfWeek[index])
                                    .padding(8)
                            }
                        }
                    }
                }
            }
        }
    }
}

 struct EditMedicationView_Previews: PreviewProvider {
     static var previews: some View {
         EditDiagnosisView(vm: EditDiagnosisVM(pet: PetData()))
     }
 }
