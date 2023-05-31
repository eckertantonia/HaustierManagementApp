//
//  MainView.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct MainView: View {
    @State var showMenu:Bool = false
    @State var linkBool:Bool = true
    
    // switch out for petlist
    var protoText: [String] = ["Bello"]
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    Text("Dashboard")
                    
                    
                }
                
                //Navigation
                GeometryReader{ _ in
                    VStack{
                        ZStack{
                            HStack {
                                
                                
                                
                            }
                        }
                        //Slide In Menu
                        SlideInMenu(protoText: protoText)
                            .offset(x: showMenu ? UIScreen.main.bounds.width/8: UIScreen.main.bounds.width,
                                    y: -UIScreen.main.bounds.height/19)
                            .animation(.easeInOut(duration: 0.3), value: showMenu)
                        
                    }
                    
                    
                }
            }
            .navigationBarTitle("Dashboard", displayMode: .inline)
            .toolbar{
                Button(action:{
                    showMenu.toggle()
                }, label: {
                    Image(systemName: "pawprint")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                    })
            }
                
                
            
        }
    }
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
