//
//  Ausprobieren.swift
//  HaustierApp
//
//  Created by Mobile1 on 12.06.23.
//

import SwiftUI

struct Ausprobieren: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.petName)
    ]) var pets: FetchedResults<PetData>
    
    var body: some View {
        List{
            
            ForEach(pets){pet in
                Text(pet.petName ?? "Unknown")
            }
            .onDelete(perform: removePet)
        }
        Button("new Pet"){
            let pet = PetData(context: managedObjectContext)
            pet.petName = "Paul"
            pet.gender = "male"
            PersistenceController.shared.save() // saving after creating new object to save to Persistence Container
        }
        
    }
    
    func removePet(at offsets: IndexSet){
        for index in offsets {
            let pet = pets[index]
            managedObjectContext.delete(pet)
            PersistenceController.shared.save()
        }
    }
}

struct Ausprobieren_Previews: PreviewProvider {
    static var previews: some View {
        Ausprobieren()
    }
}
