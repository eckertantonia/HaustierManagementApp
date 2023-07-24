//
//  PetProfileButton.swift
//  HaustierApp
//
//  Created by Mobile1 on 30.05.23.
//

import SwiftUI

struct PetProfileButton: View {
    
    private var defaultImage: String = "pawprint"
    var pet: PetData
    var pictureData: Data?
    
    init(pet: PetData, pictureData: Data?) {
        self.pet = pet
        self.pictureData = pictureData
    }
    
    var body: some View {
        NavigationLink(destination: ProfileOverview(pet: pet)){
            VStack{
                // Pic
                if let imageData = pictureData {
                    Image(uiImage: UIImage(data: imageData)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                } else {
                    Image(systemName: defaultImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .cornerRadius(10)
                }
               
                //Padding top for Top Close Button
                    //.padding(.top, 50)
                Text(pet.petName)
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

