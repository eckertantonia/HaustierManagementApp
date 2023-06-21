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
    @State private var petBirthDate: Date = Date.init()
    @State private var petGender: String = ""
    @State private var petBreed: String = ""
    @State private var petOrigin: String = ""
    @State private var petWeight: String = ""
    @State private var petHeight: String = ""
    
    let genderList = ["männlich", "weiblich"]
//    var petDataVM = PetDataViewModel(context: moc)

    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Name", text: $petName)
                        .disableAutocorrection(true)
                    DatePicker(selection: $petBirthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Geburtstag")
                    }
                    Picker("Geschlecht", selection: $petGender){
                        ForEach(genderList, id: \.self){ gender in
                            Text(gender)
                        }
                    }
                    TextField("Rasse", text: $petBreed)
                        .disableAutocorrection(true)
                    TextField("Gewicht", text: $petWeight)
                        .keyboardType(.decimalPad)
                    TextField("Größe", text: $petHeight)
                        .keyboardType(.decimalPad)
                    
                    
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
