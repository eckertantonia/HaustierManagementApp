//
//  PetProfileButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct PetProfileButton: View {
    
    //destination als var
    // image aus petData (noch nicht im Datenmodell)
    var image: String = "pawprint"
    var title: String = "name"
    var pet: PetData
    
    var body: some View {
        NavigationLink(destination: ProfileOverview(pet: pet)){
            VStack{
                // Pic
                Image(systemName: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .cornerRadius(10)
                //Padding top for Top Close Button
                    //.padding(.top, 50)
                Text(title)
                    .font(.title3)
                    .padding(.top)
                
            }
            .padding([.leading, .trailing])
        }
        .padding()
        
    }
}

struct PetProfileButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

