//
//  Dashboard.swift
//  HaustierApp
//
//  Created by Mobile1 on 22.05.23.
//

import SwiftUI

struct Dashboard: View {
    
    @State var calendarDate = Date.init()
    @ObservedObject var calendarVM : CalendarVM
    @State var showNewAppointment = false
    @State var dateSelected: Date = Date.now
    @State var editAppointment = false
    
    var calenderWidth = UIScreen.main.bounds.width*0.7
    var calenderHeight = UIScreen.main.bounds.width*0.7
    
    var calenderBackgroundWidth = UIScreen.main.bounds.width*0.75
    var calenderBackgroundHeight = UIScreen.main.bounds.width*0.7
   
    
    init(){
        self.calendarVM = CalendarVM()
        self.dateSelected = Date()
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    ForEach(calendarVM.pets, id: \.self){ pet in
                        PetProfileButton(pet: pet, pictureData: pet.profilePicture)
                    }
                }
                HStack{
                    DatePicker("", selection: $dateSelected, displayedComponents: .date)
                        .datePickerStyle(.graphical)
                        .onChange(of: dateSelected) { _ in
                            showNewAppointment.toggle()
                        }
                        .frame(height: 250 ,alignment: .center)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.custom.lightOrange)
                                .frame(width: calenderBackgroundWidth, height: calenderBackgroundHeight)
                        }
                        .accentColor(Color.custom.darkGreen)
                }
                .frame(width: calenderWidth)
                .padding(.vertical)
                
                appointmentsList
            }

            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showNewAppointment) {
                EditAppointmentView(editAppointmentVM: EditAppointmentVM(startDate: dateSelected))
            }
        }
    }
}


extension Dashboard {
    var appointmentsList: some View {
        CustomListe{
            ForEach(calendarVM.appointmentsDict.keys.sorted(by: {$0 < $1}), id: \.self) { date in
                    VStack(spacing: 10){
                        HStack{
                            Text(dateFormatter(date))
                                .darkgreenText()
                                .font(.title3)
                            Spacer()
                        }
                        Divider()
                            .background(Color.custom.darkGreen)
                        ForEach(calendarVM.appointmentsDict[date]!, id: \.title) { appointment in
                            
                            AppointmentTile(appointment: appointment)
                                .onTapGesture {
                                    editAppointment.toggle()
                                }
                                .sheet(isPresented: $editAppointment){
                                    EditAppointmentView(editAppointmentVM: EditAppointmentVM(appointment: appointment, startDate: appointment.appointmentStart), withDelete: true)
                                }
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.custom.backgroundColor)
            }
            if calendarVM.appointmentsDict.isEmpty {
                Spacer()
            }
        }
        .listStyle(.plain)
        
    }
    
    func dateFormatter(_ date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        guard let formattedString = formatter.string(for: date) else {
            return ""
        }
        return formattedString
        
    }
}
