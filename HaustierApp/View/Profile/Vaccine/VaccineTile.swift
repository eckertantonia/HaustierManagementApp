//
//  VaccineTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 04.08.23.
//

import SwiftUI

struct VaccineTile: View {
    
    var vaccine: Vaccine
    var vm: VaccineVM
    
    var body: some View {
        DetailTile(nextPage: AnyView(VaccineDetailView(vaccine: vaccine, vaccineVM: vm))){
            HStack{
                Text(vaccine.disease)
                    .darkgreenText()
                    .bold()
                Spacer()
                if let nextVaccine = vaccine.nextVaccination{
                    Text(formatDate(nextVaccine))
                        .darkgreenText()
                }
            }
        }
    }
    
    private func formatDate(_ date: Date) -> String{
        var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            return formatter
        }
        return dateFormatter.string(from: date)
    }
}

