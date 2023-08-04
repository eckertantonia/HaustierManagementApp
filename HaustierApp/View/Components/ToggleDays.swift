//
//  ToggleDays.swift
//  HaustierApp
//
//  Created by Mobile1 on 24.07.23.
//

import SwiftUI

struct ToggleDays: View {
    
    @ObservedObject var vm: EditMedicationVM
    
    @State var isRepeatOn = false
    
    var body: some View {
        NavigationView {
            Form {
                Section{
                    DatePicker("Erinnerungszeit", selection: $vm.selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.wheel)
                        .frame(height: UIScreen.main.bounds.height/4)
                }
                
                        
                Section {
                    Toggle("Wiederholen", isOn: $isRepeatOn)
                    if isRepeatOn {
                        VStack {
                            ForEach(0..<vm.daysOfWeek.count, id: \.self) { index in
                                Toggle(isOn: vm.toggleDay(index)) {
                                    Text(vm.daysOfWeek[index])
                                        .padding(8)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Wecker hinzufügen")        }
    }
}
