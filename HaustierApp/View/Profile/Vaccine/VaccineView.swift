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
        CustomNavigationView{
            VStack{
                nextVaccine
                selectedVaccines
            }
            .navigationBarTitle(title, displayMode: .inline)
            .sheet(isPresented: $showRecommendedVaccines){
                RecommendedVaccineView(vaccineVM: vaccineVM)
            }
                
        }
        .pet(pet: vaccineVM.pet)
    }
}

extension VaccineView {
    var nextVaccine : some View {
        CustomListe{
            VStack(spacing: 10){
                HStack{
                    Text("nächste Impfung")
                        .darkgreenText()
                        .font(.title3)
                    Spacer()
                }
                Divider()
                    .background(Color.custom.darkGreen)
                if let nextVaccine = vaccineVM.nextVaccine {
                    VaccineTile(vaccine: nextVaccine, vm: vaccineVM)
                }
            }
        }
        .frame(maxHeight: UIScreen.main.bounds.height*0.2)
        .scrollDisabled(true)
    }
}

extension VaccineView {
    var selectedVaccines: some View {
        
        VStack(spacing: 10){
            HStack{
                Text("\(vaccineVM.pet.petName)s \(title)")
                    .darkgreenText()
                    .font(.title3)
                Spacer()
            }
            .padding(.horizontal, 20)
            Divider()
                .background(Color.custom.darkGreen)
                .padding(.horizontal, 20)
            CustomListe{
                ForEach(vaccineVM.vaccineArray, id: \.self) { vaccine in
                   VaccineTile(vaccine: vaccine, vm: vaccineVM)

                }
                recommendedVaccines
            }
                
        }
    }
}

extension VaccineView {
    
    var recommendedVaccines: some View {
        Section{
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.custom.lightOrange)
                    .frame(width: UIScreen.main.bounds.width*0.9)
                HStack{
                    Text("empfohlene Impfungen")
                        .darkgreenText()
                        .padding(.vertical, 5)
                        .padding(.leading, 20)
                    Spacer()
                    Image(systemName: "chevron.forward")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 7, height: 7)
                        .bold()
                        .tint(.gray)
                        .opacity(0.2)
                        .padding(.trailing, 20)
                }
            }
            .padding(.all, 5)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.custom.backgroundColor)
            .onTapGesture {
                showRecommendedVaccines.toggle()
            }
        }
        .listStyle(.plain)
    }
}
