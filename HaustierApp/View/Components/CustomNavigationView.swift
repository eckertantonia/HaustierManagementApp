//
//  MainView.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//


import SwiftUI

struct CustomNavigationView<Content: View>: View {
    @State var showMenu:Bool = false
    
    var content: Content
    var pet: PetData?
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
        let navAppearance = UINavigationBarAppearance()
        
        let backButtonAppearance = UIBarButtonItemAppearance()
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.customUI.darkGreen ?? .black]
        
        navAppearance.buttonAppearance = backButtonAppearance
        
        navAppearance.shadowImage = nil
        navAppearance.shadowColor = .none
        
        let image = UIImage(systemName: "chevron.backward")?.withTintColor(UIColor.customUI.darkGreen ?? .black, renderingMode: .alwaysOriginal)
        navAppearance.setBackIndicatorImage(image, transitionMaskImage: image)
        
        navAppearance.backgroundColor = UIColor.customUI.backgroundColor
        UINavigationBar.appearance().standardAppearance = navAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navAppearance
        
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.custom.backgroundColor
                content
                   
                Sidebar(isVisible: $showMenu)
            }
            .toolbar{
                ToolbarItem{
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        ToolbarButton(showMenu: $showMenu, pet: pet)
                    })
                }
            }
        }
    }
    
    func pet(pet: PetData) -> Self {
        var copy = self
        copy.pet = pet
        return copy
    }
}
