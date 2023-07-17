//
//  FoodDetailTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//

import SwiftUI

struct FoodDetailTile: View {
    
    var food: Food
    
    var body: some View {
        NavigationLink(destination: {
            FoodDetailView(food: food)
        }, label: {
            VStack{
                HStack{
                    Text(food.foodProduct)
                    Spacer()
                }
                HStack{
                    Text(food.wrappedFoodBrand)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text(String(food.foodAmount))
                }
            }
        })
        
    }
}

struct FoodDetailTile_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailTile(food: Food())
    }
}
