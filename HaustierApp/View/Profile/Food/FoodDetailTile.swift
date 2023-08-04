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
                        .darkgreenText()
                        .font(.title3)
                    Spacer()
                }
                HStack{
                    Text(food.wrappedFoodBrand)
                        .darkgreenText()
                        .font(.footnote)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text(String(food.foodAmount))
                        .darkgreenText()
                }
            }
            
        })
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .lightOrangeBackground()
        .frame(width: UIScreen.main.bounds.width*0.9)
        .cornerRadius(10)
        
    }
}
