//
//  CustomLabeledContent.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct CustomLabeledContent: View {
    
    var label: String
    var value: String
    
    var body: some View {
        LabeledContent(label, value: value)
            .foregroundColor(Color.custom.darkGreen)
            .labeledContentStyle(.centered)
    }
}

