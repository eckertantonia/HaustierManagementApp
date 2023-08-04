//
//  DetailView.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct DetailView<Content: View>: View {
    
    var image: Data?
    var pageTitle: String
    var pet: PetData
    var sheetContent : AnyView
    var canEdit: Bool
    @State var toggleBool: Bool = false

    var content: Content

    init(pet: PetData, pageTitle: String, sheet: AnyView, canEdit: Bool = true, @ViewBuilder content: () -> Content) {
        self.pet = pet
        self.pageTitle = pageTitle
        self.sheetContent = sheet
        self.canEdit = canEdit
        self.content = content()
    }
    
    var body: some View{
    CustomNavigationView {
        VStack(alignment: .leading){
            if let imageData = image {
                HStack{
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                        .cornerRadius(80)
                    
                    Spacer()
                    VStack{
                        Button (
                            action:{
                                toggleBool.toggle()
                            }, label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .tint(Color.custom.darkGreen)
                            }
        
                        )
                        .padding(.top, 10)
                        Spacer()
                    }
                    .frame(height: 180)

                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            } else if canEdit {
                HStack{
                    Spacer()
                    VStack{
                        Button (
                            action:{
                                toggleBool.toggle()
                            }, label: {
                                Image(systemName: "pencil")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 20, height: 20)
                                    .tint(Color.custom.darkGreen)
                            }
                        )
                        .padding(.top, 10)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 20)
            } else {
                Spacer()
                    .frame(height: 50)
            }
        
            Section {
                VStack(alignment: .leading){
                    content
                    
                }
            }
            .listRowBackground(Color.custom.backgroundColor)
            .listRowSeparator(.hidden)
            Spacer()
                
            }
            .listStyle(.plain)
            .padding(.all, 5)
            .listRowBackground(Color.custom.backgroundColor)
            .navigationBarTitle(pageTitle, displayMode: .inline)
        
        }
        .pet(pet: pet)
        .sheet(isPresented: $toggleBool) {
            sheetContent
        }
        
        
    }
    
    func picture(picture: Data) -> Self {
        var copy = self
        copy.image = picture
        return copy
    }
}
