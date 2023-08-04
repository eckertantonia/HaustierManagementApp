//
//  InputForm.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct InputForm<Content: View>: View {
    
    var content: Content
    var title : String
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        NavigationStack{
            Form{
                content
            }
            .navigationBarTitle(title, displayMode: .automatic)
            .tint(Color.custom.burntOrange)
            .foregroundColor(Color.custom.darkGreen)
            .background(Color.custom.backgroundColor)
            .scrollContentBackground(.hidden)
        }
    }
}
