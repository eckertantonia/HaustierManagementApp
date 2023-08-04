//
//  CustomTextFieldSection.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct CustomTextFieldSection: View {
    
    var title: String
    var optionalText : String?
    @Binding var text: String
    
    var body: some View {
        Section{
            HStack{
                TextField(title, text: $text)
                if let text = optionalText {
                    Text(text)
                }
            }
                
        } header: {
            Text(title)
                .darkgreenText()
                .font(.body)
        }
    }
}
