//
//  SideMenuView.swift
//  HaustierApp
//
//  Created by Mobile1 on 23.05.23.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack{
            Text("Menu")
                .font(.title)
                .foregroundColor(.white)
            
            Divider()
                .frame(width: 200, height: 2)
                .background(.white)
                .padding(.horizontal, 16)
            
            //MARK: - Content
            
            
            Spacer()
        }
        .padding(16)
        .background(.black)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
