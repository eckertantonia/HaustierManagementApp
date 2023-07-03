//
//  PetDataInputView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct PetDataInputView: View {
    //TODO in ViewModel auslagern
    
    @ObservedObject var vm: PetDataInputViewModel
    
    init(vm: PetDataInputViewModel) {
        self.vm = vm
    }
    
    let genderList = ["männlich", "weiblich"]

    var body: some View {
        NavigationStack {
            Form{
                Section{
                    TextField("Name", text: $vm.petName)
                        .disableAutocorrection(true)
                    DatePicker(selection: $vm.petBirthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Geburtstag")
                    }
                    Picker("Geschlecht", selection: $vm.petGender){
                        ForEach(genderList, id: \.self){ gender in
                            Text(gender)
                        }
                    }
                    TextField("Rasse", text: $vm.petBreed)
                        .disableAutocorrection(true)
                    TextField("Herkunft", text: $vm.petOrigin)
                        .disableAutocorrection(true)
                    TextField("Gewicht", text: $vm.petWeight)
                        .keyboardType(.decimalPad)
                    TextField("Größe", text: $vm.petHeight)
                        .keyboardType(.decimalPad)
                }
              
                Button("Save"){
                    vm.save()
                }
                .centerHorizontally()
            }
            .navigationBarTitle("Tierdaten ändern", displayMode: .inline)
        }
    }
}

struct PetDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        let viewContext = PersistenceManager.shared.container.viewContext
        PetDataInputView(vm: PetDataInputViewModel(context: viewContext))
    }
}
