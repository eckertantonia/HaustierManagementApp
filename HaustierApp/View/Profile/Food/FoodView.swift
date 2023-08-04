//
//  FoodView.swift
//  HaustierApp
//
//  Created by Mobile1 on 15.07.23.
//

import SwiftUI

struct FoodView: View {
    
    @ObservedObject var foodVM: FoodVM
    
    var title: String
    @State private var showingAddFood = false
    @State private var showingAddIntolerances = false
    var pet: PetData
    
    init(pet: PetData, title: String){
        self.pet = pet
        self.title = title
        self.foodVM = FoodVM(pet: pet)
    }
    
    var body: some View {
        CustomNavigationView{
            VStack{
                foodPart
                intolerancePart
            }
            .navigationBarTitle(title, displayMode: .inline)
            .sheet(isPresented: $showingAddFood){
                // AddFoodView
                EditFoodView(vm: EditFoodVM(pet: pet))
            }
            .sheet(isPresented: $showingAddIntolerances){
                // AddIntolerancesView
                EditIntoleranceView(pet: pet)
            }
        }
        .pet(pet: foodVM.pet)

    }
}

extension FoodView {
    
    var foodPart: some View {
        VStack{
            HStack{
                Spacer()
                Button (
                    action:{
                        showingAddFood.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .tint(Color.custom.darkGreen)
                    }
                )
                .padding(.top, 10)
            }
            .padding(.horizontal, 25)
            CustomListe{
                ForEach(foodVM.foodArray, id: \.self){ food in
                    FoodDetailTile(food: food)
                    
                }
                
                if foodVM.foodArray.isEmpty {
                    Spacer()
                }
            }
        }
    }
    
}

extension FoodView {
    
    var intolerancePart: some View {
        
        VStack{
            HStack{
                Text("Unverträglichkeiten")
                    .font(.title)
                    .darkgreenText()
                    .padding()
                Spacer()
                Button (
                    action:{
                        showingAddIntolerances.toggle()
                    },label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .tint(Color.custom.darkGreen)
                    }
                )
            }
            .padding(.horizontal, 25)
            
            CustomListe{
                ForEach(foodVM.intoleranceArray, id: \.self){ intolerance in
                    ZStack(alignment: .leading){
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.custom.lightOrange)
                        Text("- \(intolerance.intolerance)")
                            .darkgreenText()
                            .padding(.vertical, 5)
                            .padding(.leading, 10)
                        
                            
                    }
                    .padding(.all, 5)
                }
                
                if foodVM.intoleranceArray.isEmpty {
                    Spacer()
                }
            }
        }
    }
}
