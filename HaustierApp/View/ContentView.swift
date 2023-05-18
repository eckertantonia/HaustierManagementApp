//
//  ContentView.swift
//  HaustierApp
//
//  Created by Mobile1 on 18.05.23.
//

import SwiftUI
import CoreData

struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped item")
    }
}

struct MenuContent: View {
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house"),
        MenuItem(text: "Home", imageName: "gear"),
        MenuItem(text: "Home", imageName: "person.circle"),
        MenuItem(text: "Home", imageName: "bell"),
        MenuItem(text: "Home", imageName: "square.and.arrow.up")
    ]
    
    var body: some View{
        ZStack{
            Color(UIColor(red: 43/255.0, green: 40/255.0, blue: 74/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    HStack{
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 32, alignment: .center)
                        Text(item.text)
                            .foregroundColor(Color.white)
                            .font(.system(size: 22))
                            .bold()
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding()
                    Divider()
                }
                Spacer()
            }
            .padding(.top, 50)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void

    var body: some View{
        ZStack{
            // Dimmed background view
            GeometryReader{ _ in
                EmptyView()
            }
            .background(.gray.opacity(0.25))
            .opacity(self.menuOpened ? 1 : 0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.toggleMenu()
            }
            // MenuContent
            HStack{
                Spacer()
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.default)
                
            }
        }
    }
}

struct ContentView: View {
    //MARK: - Properties
    @State private var showMenu: Bool = false
    
    //MARK: - ViewBody
    var body: some View {
        NavigationView{
            ZStack{
                Color.mint.ignoresSafeArea(.all, edges: .all)
                VStack{
                    Text("ContentView")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                    
                }
                
                GeometryReader{ _ in
                    
                    HStack {
                        Spacer()
                        SideMenuView()
                            .offset(x: showMenu ? 0: UIScreen.main.bounds.width)
                            .animation(.easeInOut(duration: 0.3), value: showMenu)
                    }
                    
                }
                .background(.black.opacity(showMenu ? 0.5 : 0))
                
            }
            .navigationTitle("Pet App")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button{
                    self.showMenu.toggle()
                } label: {
                    if showMenu {
                        Image(systemName: "xmark")
                            .font(.title)
                            .foregroundColor(.white)
                    } else {
                        Image(systemName: "text.justify")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
