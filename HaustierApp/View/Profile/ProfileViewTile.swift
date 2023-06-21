//
//  ProfileViewTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import SwiftUI

struct ProfileViewTile: View {
    
    var tileTitle: String
    var tileDetails: ArraySlice<String>
    
    init(tileDetails: [String]) {
        self.tileTitle = tileDetails[0]
        self.tileDetails = tileDetails.dropFirst(1)// array except first
    }
    
    var body: some View {
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
}

struct ProfileViewTile_Previews: PreviewProvider {
    static var previews: some View {
        ProfileViewTile(tileDetails: ["title", "detail"])
    }
}
