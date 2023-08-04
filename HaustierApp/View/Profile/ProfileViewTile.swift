//
//  ProfileViewTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import SwiftUI

struct ProfileViewTile: View {
    
    var tileTitle: String
    @State var tileDetails: [String]
    var profileVM : ProfileViewVM
    
    var tileHeight = UIScreen.main.bounds.width*0.2
    
    
    init(title: String, vm: ProfileViewVM) {
        self.tileTitle = title
        self.tileDetails = [String]()
        self.profileVM = vm
    }
    
    var body: some View {
            HStack{
                VStack(alignment: .leading){
                    Text(tileTitle)
                        .font(.title2)
                        .bold()
                        .darkgreenText()
                    Spacer()
                }
                Spacer()
                VStack(alignment: .trailing){
                    ForEach(tileDetails, id: \.self){ detail in
                        Spacer()
                        Text(detail)
                            .darkgreenText()
                            .multilineTextAlignment(.trailing)
                            
                    }
                }
                Image(systemName: "chevron.forward")
                    .tint(Color.custom.darkGreen)
            }
            .frame(height: tileHeight)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .lightOrangeBackground()
            .frame(width: UIScreen.main.bounds.width*0.9)
            .cornerRadius(10)
            .onAppear{
                tileDetails = profileVM.tileDetails(tileTitle: tileTitle)
            }
        }
}
