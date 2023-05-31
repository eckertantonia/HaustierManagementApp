//
//  SideMenuView.swift
//  HaustierApp
//
//  Created by Mobile1 on 23.05.23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack{
                VStack{
                    Circle()
                        .frame(width: 100, height: 100)
                    Text("petNAme")
                }
                .padding()
                VStack{
                    Image(systemName: "plus.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100.0, height: 100.0)
                                .clipShape(Circle())
                    Text("add")
                }
                .padding()
            }
            .padding()
            .padding(.top, 30)
            
        }
        .frame(height: UIScreen.main.bounds.height/4, alignment: .center)
        .background(.gray)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
