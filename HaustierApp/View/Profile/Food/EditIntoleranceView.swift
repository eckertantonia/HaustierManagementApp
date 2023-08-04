//
//  EditIntoleranceView.swift
//  HaustierApp
//
//  Created by Mobile1 on 16.07.23.
//

import SwiftUI

struct EditIntoleranceView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var editIntoleranceVM: EditFoodIntoleranceVM
    
    init(pet: PetData){
        self.editIntoleranceVM = EditFoodIntoleranceVM(pet: pet)
    }
    var body: some View {
        InputForm(title: "Neue Unverträglichkeit"){
            CustomTextFieldSection(title: "Unverträglichkeit", text: $editIntoleranceVM.foodIntolerance)
            SaveButton(saveFunc: editIntoleranceVM.save, dismiss: dismiss)
        }
    }
}
