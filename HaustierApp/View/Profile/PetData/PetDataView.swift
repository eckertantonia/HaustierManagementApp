//
//  PetDataView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

// mit ViewModel arbeiten

struct PetDataView: View {
    
    @ObservedObject var petDataVM: PetDataViewModel
    var title: String
    
    init(pet: PetData, title: String){
        petDataVM = PetDataViewModel(pet: pet)
        self.title = title
//        petDataVM.setPet(pet: self.pet)
    }
    
    var body: some View {
        NavigationStack {
            List{
                Section{
                    if let imageData = petDataVM.pet!.profilePicture {
                        Image(uiImage: UIImage(data: imageData)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .cornerRadius(10)
                    }
                }
                Section {
                    HStack{
                        Text("Name")
                        Text(petDataVM.pet!.petName)
                            .font(.title3)
                    }
                    HStack{
                        Text("Geburtstag")
                        Text(petDataVM.birthdayFormatter())
                            .font(.title3)
                    }
                    HStack{
                        Text("Geschlecht")
                        Text(petDataVM.pet!.gender ?? "")
                            .font(.title3)
                    }
                    HStack{
                        Text("Rasse")
                        Text(petDataVM.pet!.petBreed ?? "")
                            .font(.title3)
                    }
                    HStack{
                        Text("Herkunft")
                        Text(petDataVM.pet!.placeOfOrigin ?? "")
                            .font(.title3)
                    }
                    HStack{
                        Text("Gewicht")
                        Text(String(petDataVM.pet!.petWeight))
                            .font(.title3)
                        Text("kg")
                    }
                    HStack{
                        Text("Schulterhöhe")
                        Text(String(petDataVM.pet!.petHeight))
                            .font(.title3)
                        Text("cm")
                    }
                }
            }
                .navigationBarTitle(title, displayMode: .automatic)
                .toolbar{
                    NavigationLink(destination: PetDataInputView(vm: PetDataInputViewModel(pet: petDataVM.pet))){
                        Text("Edit")
                    }
                }
        }
        
    }
}

struct PetDataView_Previews: PreviewProvider {
    static var previews: some View {
        PetDataView(pet: PetData(), title: "Titel")
    }
}
