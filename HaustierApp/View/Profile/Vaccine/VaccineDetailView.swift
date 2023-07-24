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
        VStack{
            HStack{
                Text(vaccine.disease)
                    .font(.title)
                    .padding()
                
            }
            HStack{
                Text("Krankheit")
                Text(vaccine.disease)
            }
            HStack{
                Text("empfohlenes Alter")
                Text(vaccine.wrappedRecommendedAge)
            }
            HStack{
//                Text("letzte Impfung")
                DatePicker(selection: $vaccineVM.selectedDate, in: ...Date.now, displayedComponents: .date){
                    Text("letzte Impfung")
                }
                .onChange(of: vaccineVM.selectedDate){ newValue in
                    vaccineVM.updateVaccinationDate(vaccine: vaccine)
                }
            }
            .padding()
            HStack{
                Text("nächste Impfung")
//                if let nextDate = $vm.nextVaccinationDate {
                if let nextDate = vaccineVM.nextVaccinationDate {
                    Text(nextDate)
                } else {
                    Text(dateFormatter.string(from: vaccine.nextVaccination ?? Date()))
                }
                
               
            }
            VStack{
                Text("Informationen")
                Text(vaccine.wrappedNotes)
            }
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

struct VaccineDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VaccineDetailView(vaccine: Vaccine(), vaccineVM: VaccineVM(pet: PetData()))
    }
}
