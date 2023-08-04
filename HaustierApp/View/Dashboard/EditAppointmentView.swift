//
//  EditAppointmentView.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.07.23.
//

import SwiftUI

struct EditAppointmentView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var editAppointmentVM: EditAppointmentVM
    var withDelete: Bool = false
    
    var body: some View {
        InputForm(title: "Termin"){
                CustomTextFieldSection(title: "Titel", text: $editAppointmentVM.title)
                CustomTextFieldSection(title: "Ort", text: $editAppointmentVM.location)
                
                Section{
                    HStack{
                        Spacer()
                        DatePicker("", selection: $editAppointmentVM.dateBegin, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(.compact)
                            
                        Spacer()
                            
                    }
                } header: {
                    Text("Beginn")
                        .darkgreenText()
                        .font(.body)
                }
                .listRowBackground(Color.custom.backgroundColor)
                .onChange(of: editAppointmentVM.dateBegin) { newValue in
                    editAppointmentVM.changeEndTime()
                }
                        
                Section{
                    HStack{
                        Spacer()
                        DatePicker("", selection: $editAppointmentVM.dateEnd, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(.compact)
                        Spacer()
                    }
                } header: {
                    Text("Ende")
                        .darkgreenText()
                        .font(.body)
                }
                .listRowBackground(Color.custom.backgroundColor)
                
                Section{
                    HStack{
                        Spacer()
                        DatePicker("", selection: $editAppointmentVM.dateNotification, displayedComponents: [.date, .hourAndMinute])
                            .labelsHidden()
                            .datePickerStyle(.compact)
                        Spacer()
                            
                    }
                } header: {
                    Text("Erinnerung")
                        .darkgreenText()
                        .font(.body)
                }
                .listRowBackground(Color.custom.backgroundColor)
                
                Section{
                    TextEditor(text: $editAppointmentVM.notes)
                } header: {
                    Text("Notizen")
                        .darkgreenText()
                        .font(.body)
                }
            
                SaveButton(saveFunc: editAppointmentVM.save, dismiss: dismiss)
                
                if withDelete {
                    DeleteButton(deleteFunc: editAppointmentVM.delete, dismiss: dismiss)
                }
            }
    }
}
