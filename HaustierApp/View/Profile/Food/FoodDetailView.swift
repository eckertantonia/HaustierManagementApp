//
//  FoodDetailView.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//

import SwiftUI

struct FoodDetailView: View {
    
    @ObservedObject var food: Food
    @State var showingEditFood = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Futter Details")
                    .font(.title)
                    .padding()
                Spacer()
                Button (
                    action:{
                        showingEditFood.toggle()
                    }, label: {
                        Image(systemName: "plus")
                    }
                    
                )
            }
            HStack{
                Text("Marke")
                Text(food.wrappedFoodBrand)
            }
            .padding()
            HStack{
                Text("Produkt")
                Text(food.foodProduct)
            }
            .padding()
            HStack{
//                Spacer()
                Text(food.wrappedFoodType)
            }
            .padding()
            HStack{
                Text("Menge")
                Text(String(food.foodAmount))
                Text("gramm")
            }
            .padding()
        }
        .sheet(isPresented: $showingEditFood){
            // AddFoodView
            EditFoodView(vm: EditFoodVM(food: food,pet: food.pet!))
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(food: Food())
    }
}
