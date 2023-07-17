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
        NavigationStack{
            Form{
                Section{
                    TextField("neue Unverträglichkeit", text: $editIntoleranceVM.foodIntolerance)
                        .disableAutocorrection(true)
                }
                Section{
                    Button("Speichern") {
                        editIntoleranceVM.save()
                        dismiss()
                    }
                    .centerHorizontally()
                }
            }
        }
    }
}

struct EditIntoleranceView_Previews: PreviewProvider {
    static var previews: some View {
        EditIntoleranceView(pet: PetData())
    }
}
