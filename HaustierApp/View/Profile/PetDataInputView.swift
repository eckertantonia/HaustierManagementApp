//
//  PetDataInputView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct PetDataInputView: View {
    //TODO in ViewModel auslagern
    @Environment(\.managedObjectContext) var moc
    @State private var petName: String = ""
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("Pet Name", text: $petName)
                        .disableAutocorrection(true)
                    
                }
                Button("Save"){
                    let petData = PetData(context: moc)
                    petData.petName = self.petName
                    
                    do {
                        try self.moc.save()
                        print("\(petData)")
                        
                    } catch {
                        print("error \(error.localizedDescription)")
                    }
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
