//
//  DiagnosisTile.swift
//  HaustierApp
//
//  Created by Mobile1 on 17.07.23.
//

import SwiftUI

struct DiagnosisTile: View {
    
    var diagnosis: Diagnosis
    
    var body: some View {
        DetailTile(nextPage: AnyView(DiagnosisDetailView(diagnosis: diagnosis))){
            VStack{
                HStack{
                    Text(diagnosis.wrappedDescription)
                        .darkgreenText()
                        .bold()
                    Spacer()
                }
            }
        }
    }
}
