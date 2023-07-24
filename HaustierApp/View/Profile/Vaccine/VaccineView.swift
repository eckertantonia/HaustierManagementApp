//
//  VaccineView.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.07.23.
//

import SwiftUI

struct VaccineView: View {
    
    @State var showRecommendedVaccines = false
    @ObservedObject var vaccineVM: VaccineVM
    
    var title: String
    
    init(pet: PetData, title: String){
        self.vaccineVM = VaccineVM(pet: pet)
        self.title = title
    }
    
    var body: some View {
        NavigationStack{
            Text(title)
                .font(.title)
            selectedVaccines
            recommendedVaccines
                .sheet(isPresented: $showRecommendedVaccines){
                    RecommendedVaccineView(vaccineVM: vaccineVM)
                }
                
        }
    }
}

extension VaccineView {
    var selectedVaccines: some View {
        VStack{
            Text("\(vaccineVM.pet.petName)s \(title)")
                .font(.title2)
            List{
                ForEach(vaccineVM.vaccineArray, id: \.self) { vaccine in
                    NavigationLink(destination: {VaccineDetailView(vaccine: vaccine, vaccineVM: vaccineVM)
                    }, label: {
                        HStack{
                            Text(vaccine.disease)
                            Spacer()
                        }
                    })
                }
            }
        }
    }
}

extension VaccineView {
    
    var recommendedVaccines: some View {
        List{
            Text("empfohlene Impfungen")
                .onTapGesture {
                    showRecommendedVaccines.toggle()
                }
        }
    }
}

struct VaccineView_Previews: PreviewProvider {
    static var previews: some View {
        VaccineView(pet: PetData(), title: "VaccineView")
    }
}
