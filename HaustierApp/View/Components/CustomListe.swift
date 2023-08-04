//
//  CustomListe.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct CustomListe<Content: View>: View {
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        List{
            content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.custom.backgroundColor)
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.custom.backgroundColor)
        
    }
}
