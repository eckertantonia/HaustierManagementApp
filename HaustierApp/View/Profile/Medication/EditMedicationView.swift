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
        InputForm(title: "Medikament"){
            CustomTextFieldSection(title: "Medikament", text: $editMedicationVM.medicationName)
            CustomTextFieldSection(title: "Marke", text: $editMedicationVM.medicationBrand)
            CustomTextFieldSection(title: "Menge", optionalText: "Tablette(n)", text: $editMedicationVM.medicationAmount)

            Section{
                Toggle(isOn: $editMedicationVM.addAlarm, label: {
                    Text("Wecker")
                })
                
                if editMedicationVM.addAlarm {
                    alarmSetting
                }
            }
            SaveButton(saveFunc: editMedicationVM.save, dismiss: dismiss)
        }
    }
 }

extension EditMedicationView {
    var alarmSetting: some View {
        Group {
            Section{
                DatePicker("Erinnerungszeit", selection: $editMedicationVM.selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(.wheel)
                    .labelsHidden()
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
