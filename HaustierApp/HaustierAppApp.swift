//
//  HaustierAppApp.swift
//  HaustierApp
//
//  Created by Mobile1 on 18.05.23.
//

import SwiftUI

@main
struct HaustierAppApp: App {
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceManager = PersistenceManager.shared

    var body: some Scene {
        WindowGroup {
            let viewContext = persistenceManager.container.viewContext
            ContentView()
                .environment(\.managedObjectContext, viewContext)
            
        }
        // saves when app moves to background
        .onChange(of: scenePhase){ _ in
            persistenceManager.save()
        }
    }
}
