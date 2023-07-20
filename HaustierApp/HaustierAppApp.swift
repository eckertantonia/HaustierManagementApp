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
    
//    init(){
//        setupAppearance()
//    }

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
    
//    func setupAppearance() {
//        let appearance = UINavigationBarAppearance()
//        appearance.backgroundColor = UIColor.Custom_UI().lightBeige // Hier kannst du die Hintergrundfarbe anpassen
//
//        any View.appearance().standardAppearance = appearance
////        UINavigationBar.appearance().scrollEdgeAppearance = appearance
//
//        // Weitere Einstellungen für das Erscheinungsbild der App hier vornehmen...
//        }
}
