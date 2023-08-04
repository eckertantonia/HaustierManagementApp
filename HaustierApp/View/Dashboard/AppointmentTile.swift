//
//  AppointmentTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 31.07.23.
//

import SwiftUI

struct AppointmentTile: View {
    
    var appointment : Appointment
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Erinnerung")
                    .darkgreenText()
                    .fontWeight(.thin)
//                Spacer()
                Text(appointment.title)
                    .darkgreenText()
                    .font(.title2)
            }
            Spacer()
            VStack(alignment: .trailing){
                Text("Uhrzeit")
                    .fontWeight(.thin)
                    .hidden()
//                Spacer()
                HStack{
                    Text(dateFormatter.string(from: appointment.appointmentStart))
                        .darkgreenText()
                    Text("Uhr")
                        .darkgreenText()
                }
                .font(.title2)
                
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .lightOrangeBackground()
        .frame(width: UIScreen.main.bounds.width*0.9)
        .cornerRadius(10)
    }
}

extension AppointmentTile {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }
}
