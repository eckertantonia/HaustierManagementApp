//
//  VaccineDetailView.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.07.23.
//

import SwiftUI

struct VaccineDetailView: View {
    
    @ObservedObject var vaccine: Vaccine
    @ObservedObject var vaccineVM: VaccineVM
    
    init(vaccine: Vaccine, vaccineVM: VaccineVM){
        self.vaccine = vaccine
        self.vaccineVM = vaccineVM
    }
    
    
    var body: some View {
        DetailView(pet: vaccine.pet!, pageTitle: vaccine.disease, sheet: AnyView(EmptyView()), canEdit: false) {
            CustomLabeledContent(label: "Krankheit", value: vaccine.disease)
            CustomLabeledContent(label: "empfohlenes Alter", value: vaccine.wrappedRecommendedAge)
            HStack{
                CustomLabeledContent(label: "Letzte Impfung", value: "")
                DatePicker(selection: $vaccineVM.selectedDate, in: ...Date.now, displayedComponents: .date){
                    Text("letzte Impfung")
                }
                .onChange(of: vaccineVM.selectedDate){ newValue in
                    vaccineVM.updateVaccinationDate(vaccine: vaccine)
                }
            }
            HStack{
                if let nextDate = vaccine.nextVaccination {
                    CustomLabeledContent(label: "nächste Impfung", value: dateFormatter.string(from: nextDate))
                } else {
                    CustomLabeledContent(label: "nächste Impfung", value: "-")
                }
            }
            CustomLabeledContent(label: "Informationen", value: vaccine.wrappedNotes)
        }

    }
}

extension VaccineDetailView {
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}
