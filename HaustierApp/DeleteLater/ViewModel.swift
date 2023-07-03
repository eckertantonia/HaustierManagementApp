//
//  ViewModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import Foundation
import SwiftUI

class PetList: ObservableObject {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    // get all pets from Core Data Container
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.petName)
    ]) var pets: FetchedResults<PetData>
    
    func addPet(petName:String) {
        let newPet = PetData(context: managedObjectContext)
        newPet.petName = petName
        PersistenceManager.shared.save()
    }
    
}
