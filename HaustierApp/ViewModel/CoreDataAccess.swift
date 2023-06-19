//
//  CoreDataAccess.swift
//  HaustierApp
//
//  Created by Mobile1 on 12.06.23.
//

import Foundation
import SwiftUI
struct CoreDataAccess{
    // Singleton
    static let coreDataAccess = CoreDataAccess()
    
    func fetchPets() -> FetchedResults<PetData>{
        @FetchRequest(sortDescriptors: [
            SortDescriptor(\.petName)
        ]) var pets: FetchedResults<PetData>
        
        return pets
    }
}
