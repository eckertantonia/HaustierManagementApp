//
//  EditFoodView.swift
//  HaustierApp
//
//  Created by Mobile1 on 15.07.23.
//

import SwiftUI

struct EditFoodView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var editFoodVM: EditFoodVM
    
    init(vm: EditFoodVM){
        self.editFoodVM = vm
    }
    
    var body: some View {
        InputForm(title: "Futter") {
            CustomTextFieldSection(title: "Marke", text: $editFoodVM.foodBrand)
            CustomTextFieldSection(title: "Produkt", text: $editFoodVM.foodProduct)
            Picker("", selection: $editFoodVM.foodType) {
                ForEach(editFoodVM.foodTypes, id: \.self) {
                    Text($0)
                }
            }
            CustomTextFieldSection(title: "Menge", optionalText: "gramm", text: $editFoodVM.foodAmount)
            SaveButton(saveFunc: editFoodVM.save, dismiss: dismiss)
        }
    }
}
