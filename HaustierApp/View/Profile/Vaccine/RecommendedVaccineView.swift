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
        NavigationStack{
            CustomListe{
                ForEach(vaccineVM.JSONvaccines, id: \.disease){ vaccine in
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.custom.lightOrange)
                        Toggle(vaccine.disease, isOn: vaccineVM.isToggled(for: vaccine.disease))
                            .tint(Color.custom.green)
                            .foregroundColor(Color.custom.darkGreen)
                            .padding(.horizontal, 15)
                    }
                    .padding(.all, 5)
                    
                }
            }
            .navigationBarTitle("Empfohlene Impfungen", displayMode: .automatic)
        }
    }
}
