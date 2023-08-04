//
//  PetDataInputView.swift
//  HaustierApp
//
//  Created by Mobile1 on 01.06.23.
//

import SwiftUI
import PhotosUI

struct PetDataInputView: View {
    @ObservedObject var vm: PetDataInputViewModel
    @Environment(\.dismiss) var dismiss
    @State private var showingImagePicker = false

    var body: some View {
        InputForm(title: "Tierdaten") {
            Section {
                Button {
                    showingImagePicker.toggle()
                } label: {
                    if let profilePic = vm.selectedPicture {
                        Image(uiImage: profilePic)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    } else {
                        Image(systemName: "pawprint")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    }
                }
            } header: {
                Text("Profilbild auswählen")
                    .darkgreenText()
                    .font(.body)
            }
            
            CustomTextFieldSection(title: "Name", text: $vm.petName)
            
            Section{
                HStack{
                    Spacer()
                    DatePicker(selection: $vm.petBirthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Geburtstag")
                    }
                    .labelsHidden()
                    Spacer()
                }
            } header: {
                Text("Geburtstag")
                    .darkgreenText()
                    .font(.body)
            }
            .listRowBackground(Color.custom.backgroundColor)
            
            Section{
                Picker("Geschlecht", selection: $vm.petGender) {
                    ForEach(vm.genderList, id: \.self) {
                        Text($0)
                    }
                }
                .labelsHidden()
            } header: {
                Text("Geschlecht")
                    .darkgreenText()
                    .font(.body)
            }
            
            CustomTextFieldSection(title: "Rasse", text: $vm.petBreed)
            CustomTextFieldSection(title: "Herkunft", text: $vm.petOrigin)
            CustomTextFieldSection(title: "Gewicht", optionalText: "kg", text: $vm.petWeight)
            CustomTextFieldSection(title: "Schulterhöhe", optionalText: "cm", text: $vm.petHeight)
            SaveButton(saveFunc: vm.save, dismiss: dismiss)
            
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $vm.selectedPicture)
        }
    }
}
