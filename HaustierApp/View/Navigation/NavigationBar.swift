//
//  NavigationBar.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct NavigationBar: View {
    var title = "PetApp"
    @State var showMenu:Bool = false
    var body: some View {
        ZStack{
            Color.green
            HStack {
                Text(title)
                    .font(.title.weight(.bold))
                    .frame(maxWidth: .infinity, alignment: .center)
                Button{
                    self.showMenu.toggle()
                } label: {
                    if showMenu {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.black)
                    } else {
                        Image(systemName: "text.justify")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                }
                .padding()
                
            }
            GeometryReader{ _ in
                HStack {
                    Spacer()
                    //SideMenuView()
                        .offset(x: showMenu ? UIScreen.main.bounds.width/8: UIScreen.main.bounds.width, y: 70)
                        .animation(.easeInOut(duration: 0.3), value: showMenu)
                }
                
            }
            
        }
        .frame(height: 70)
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    struct NavigationBar_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
