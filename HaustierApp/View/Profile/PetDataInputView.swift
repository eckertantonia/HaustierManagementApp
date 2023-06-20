//
//  PetDataInputView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct PetDataInputView: View {
    //TODO in ViewModel auslagern
    @Environment(\.managedObjectContext) var context
    @State private var petName: String = ""
    @State private var petGender: String = ""
//    var petDataVM = PetDataViewModel(context: moc)

    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Pet Name", text: $petName)
                        .disableAutocorrection(true)
                    VStack{
                        Text("Gender")
                        RadioButtonGroups{ selected in
                            petGender = selected
                        }
                    }
                    
                }
                Button("Save"){
                       PetDataViewModel(context: context).savePetData(name: petName, gender: petGender)
                }
            }
            .navigationBarTitle("Edit Pet Data", displayMode: .inline)
        }
    }
}

struct PetDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        PetDataInputView()
    }
}
