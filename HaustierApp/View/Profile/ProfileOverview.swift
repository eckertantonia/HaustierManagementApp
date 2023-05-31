//
//  ProfileOverview.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.05.23.
//

import SwiftUI

struct ProfileOverview: View {
    
    
    init(){
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View{
        VStack {
            OverviewTile(petAttribute: "petData")
            Spacer()
            OverviewTile(petAttribute: "food")
            Spacer()
            OverviewTile(petAttribute: "diagnosis")
            Spacer()
            OverviewTile(petAttribute: "medication")
            Spacer()
            OverviewTile(petAttribute: "vaccine")
        }
        .padding(.vertical, 50)
        .navigationTitle("PetData")
    }
    
}

struct ProfileOverview_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
