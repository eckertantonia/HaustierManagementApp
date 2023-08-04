//
//  CustomLabeledContentStyle.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.08.23.
//

import SwiftUI

struct CustomLabeledContentStyle: LabeledContentStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            HStack{
                Spacer()
                configuration.label
                    .font(.body)
            }
            .padding(.trailing, 10)
            .frame(width: 170)
            
            
//            VStack(alignment: .leading) {
                configuration.content
                    .font(.title3)
                    .multilineTextAlignment(.leading)
//            }
        }
        .padding(.vertical, 5)
        
    }
}
