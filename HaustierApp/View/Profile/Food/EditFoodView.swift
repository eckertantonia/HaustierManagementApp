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
        NavigationStack {
            Form{
                Section{
                    TextField("Marke", text: $editFoodVM.foodBrand)
                        .disableAutocorrection(true)
                    TextField("Produkt", text: $editFoodVM.foodProduct)
                        .disableAutocorrection(true)
                    Picker("", selection: $editFoodVM.foodType) {
                        ForEach(editFoodVM.foodTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Menge in gramm", text: $editFoodVM.foodAmount)
                }
                Section{
                    Button("Speichern") {
                        editFoodVM.save()
                        dismiss()
                    }
                    .centerHorizontally()
                }
            }
        }
    }
}

//struct EditFoodView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditFoodView()
//    }
//}
