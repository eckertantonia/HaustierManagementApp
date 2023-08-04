//
//  PetDataView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI

struct PetDataView: View {
    
    @ObservedObject var petDataVM: PetDataViewModel
    @State var showEditPetData = false
    var title: String
    var leftSideWidth = UIScreen.main.bounds.width*0.4
    
    init(pet: PetData, title: String){
        petDataVM = PetDataViewModel(pet: pet)
        self.title = title
    }
    
    var body: some View {
        DetailView(pet: petDataVM.pet!, pageTitle: title, sheet: AnyView(PetDataInputView(vm: PetDataInputViewModel(pet: petDataVM.pet)))){
            CustomLabeledContent(label: "Name", value: petDataVM.pet!.petName)
            CustomLabeledContent(label: "Geburtstag", value: petDataVM.birthdayFormatter())
            CustomLabeledContent(label: "Geschlecht", value: petDataVM.pet!.gender)
            CustomLabeledContent(label: "Rasse", value: petDataVM.pet!.petBreed ?? "")
            CustomLabeledContent(label: "Herkunft", value: petDataVM.pet!.placeOfOrigin ?? "")
            CustomLabeledContent(label: "Gewicht", value: String(petDataVM.pet!.petWeight)+" kg")
            CustomLabeledContent(label: "Schulterhöhe", value: String(petDataVM.pet!.petHeight)+" cm")
        }
        .picture(picture: petDataVM.pet!.profilePicture!)
    }
}

