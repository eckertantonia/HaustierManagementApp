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
        NavigationLink(destination: {
            DiagnosisDetailView(diagnosis: diagnosis)
        }, label: {
            VStack{
                HStack{
                    Text(diagnosis.diagnosisDescription)
                    Spacer()
                }
            }
        })
    }
}

//struct DiagnosisTile_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnosisTile()
//    }
//}
