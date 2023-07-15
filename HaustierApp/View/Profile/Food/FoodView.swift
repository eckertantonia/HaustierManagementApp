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
//        petDataVM.setPet(pet: self.pet)
    }
    
    var body: some View {
        NavigationStack{
            foodPart
            intolerancePart
                .navigationBarTitle(title)
                .sheet(isPresented: $showingAddFood){
                    // AddFoodView
                    EditFoodView(pet: pet)
                }
                .sheet(isPresented: $showingAddIntolerances){
                    // AddIntolerancesView
                }
            
        }
        
            
    }
}

extension FoodView {
    
    var foodPart: some View {
        VStack{
            Text(title)
                .font(.title)
            HStack{
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
                    Text(food.wrappedFoodBrand + " " + food.wrappedFoodProduct)
                }
            }
        }
    }
    
}

extension FoodView {
    
    var intolerancePart: some View {
        
        Text("IntolerancePart")
            .font(.title)
        
    }
}

//struct FoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodView()
//    }
//}
