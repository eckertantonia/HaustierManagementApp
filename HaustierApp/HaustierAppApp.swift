//
//  HaustierAppApp.swift
//  HaustierApp
//
//  Created by Mobile1 on 18.05.23.
//

import SwiftUI

@main
struct HaustierAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
