//
//  ProfileViewTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import SwiftUI

struct ProfileViewTile<Content: View>: View {
    
    var tileTitle: String
    var tileDetails: ArraySlice<String>
    var destinationView: Content
    
    
    init(tileDetails: [String], @ViewBuilder destinationView: () -> Content) {
        self.tileTitle = tileDetails[0]
        self.tileDetails = tileDetails.dropFirst(1)// array except first
        self.destinationView = destinationView()
        
    }
    
    var body: some View {
        NavigationLink(destination: destinationView){
            HStack{
                VStack {
                    Text(tileTitle)
                        .multilineTextAlignment(.leading)
                        .font(.title)
                    Spacer()
                }
                Spacer()
                VStack(alignment: .trailing){
                    ForEach(tileDetails, id: \.self){ detail in
                        Text(detail)
                    }
                }
            }
            .padding()
        }
        .listRowBackground(Color.ui.blueWhite)
    }
}

struct ProfileViewTile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewTile<AnyView>(tileDetails: ["title", "detail"], destinationView: {AnyView(PetDataView(pet: PetData(), title: "Titel"))})
    }
}
