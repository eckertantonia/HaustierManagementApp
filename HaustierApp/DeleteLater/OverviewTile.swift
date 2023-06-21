//
//  OverviewTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 26.05.23.
//

import SwiftUI

struct OverviewTile: View {
    
    var petAttribute: String
    
    var body: some View {
        ZStack {
            HStack{
                Text(petAttribute)
                    .multilineTextAlignment(.leading)
                Spacer()
                VStack{
                    Text("name")
                        .multilineTextAlignment(.trailing)
                    Text("breed")
                        .multilineTextAlignment(.trailing)
                    Text("age")
                        .multilineTextAlignment(.trailing)
                }
                
            }
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.green)
                    .frame(width: UIScreen.main.bounds.width*0.95,height: 100))
            .padding()
        }
        .padding()
        
    }
}

struct OverviewTile_Previews: PreviewProvider {
    static var previews: some View {
        OverviewTile(petAttribute: "beispiel")
    }
}
