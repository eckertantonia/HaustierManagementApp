//
//  RecommendedVaccineView.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.07.23.
//

import SwiftUI

struct RecommendedVaccineView: View {
    
    @State var toggleHelper = false
    
    @ObservedObject var vaccineVM: VaccineVM
    
    var body: some View {
        List{
            ForEach(vaccineVM.JSONvaccines, id: \.disease){ vaccine in
                Toggle(vaccine.disease, isOn: vaccineVM.isToggled(for: vaccine.disease))
            }
        }
    }
}

struct RecommendedVaccineView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedVaccineView(vaccineVM: VaccineVM(pet: PetData()))
    }
}
