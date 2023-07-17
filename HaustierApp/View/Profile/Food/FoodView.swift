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
        NavigationStack{
            foodPart
            intolerancePart
                .navigationBarTitle(title)
                .sheet(isPresented: $showingAddFood){
                    // AddFoodView
                    EditFoodView(vm: EditFoodVM(pet: pet))
                }
                .sheet(isPresented: $showingAddIntolerances){
                    // AddIntolerancesView
                    EditIntoleranceView(pet: pet)
                }
            
        }
        
            
    }
}

extension FoodView {
    
    var foodPart: some View {
        VStack{
            HStack{
                Text(title)
                    .font(.title)
                    .padding()
                Spacer()
                Button (
                    action:{
                        showingAddFood.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }
                    
                )
                .padding()
            }
            List{
                ForEach(foodVM.foodArray, id: \.self){ food in
//                    Text(food.wrappedFoodBrand + " " + food.wrappedFoodProduct)
                    FoodDetailTile(food: food)
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
                    .padding()
                Spacer()
                Button (
                    action:{
                        showingAddIntolerances.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }
                    
                )
                .padding()
            }
            List{
                ForEach(foodVM.intoleranceArray, id: \.self){ intolerance in
                    Text(intolerance.intolerance)
                }
            }
        }
    }
}

//struct FoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodView()
//    }
//}
