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
        NavigationStack {
            Form {
                Section {
                    Button("Profilbild auswählen") {
                        showingImagePicker.toggle()
                    }
                    Group{
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
                }

                Section {
                    TextField("Name", text: $vm.petName)
                        .disableAutocorrection(true)
                    DatePicker(selection: $vm.petBirthDate, in: ...Date.now, displayedComponents: .date) {
                        Text("Geburtstag")
                    }
                    Picker("Geschlecht", selection: $vm.petGender) {
                        ForEach(vm.genderList, id: \.self) {
                            Text($0)
                        }
                    }
                    TextField("Rasse", text: $vm.petBreed)
                        .disableAutocorrection(true)
                    TextField("Herkunft", text: $vm.petOrigin)
                        .disableAutocorrection(true)
                    HStack {
                        TextField("Gewicht", text: $vm.petWeight)
                            .keyboardType(.decimalPad)
                        Text("kg")
                    }
                    HStack {
                        TextField("Größe in cm", text: $vm.petHeight)
                            .keyboardType(.decimalPad)
                        Text("cm")
                    }
                }

                Section {
                    Button("Speichern") {
                        vm.save()
                        dismiss()
                    }
                    .centerHorizontally()
                }
            }
            .navigationBarTitle("Tierdaten ändern", displayMode: .inline)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $vm.selectedPicture)
            }
        }
    }
}

struct PetDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        PetDataInputView(vm: PetDataInputViewModel())
    }
}
