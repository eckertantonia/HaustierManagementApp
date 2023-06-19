//
//  HaustierAppApp.swift
//  HaustierApp
//
//  Created by Mobile1 on 18.05.23.
//

import SwiftUI

@main
struct HaustierAppApp: App {
    @EnvironmentObject var petList:PetList
    
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared
    

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        // saves when app moves to background
        .onChange(of: scenePhase){ _ in
            persistenceController.save()
        }
    }
}
