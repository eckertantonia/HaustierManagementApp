//
//  View+Extensions.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import SwiftUI

extension View {
    func centerHorizontally() -> some View {
        HStack{
            Spacer()
            self
            Spacer()
        }
    }
    
    func lightOrangeBackground() -> some View {
        self.background(Color.custom.lightOrange)
    }
}

extension Text {
    func darkgreenText() -> some View {
        self.foregroundColor(Color.custom.darkGreen)
    }
}

extension LabeledContentStyle where Self == CustomLabeledContentStyle {
    static var centered: CustomLabeledContentStyle { .init() }
}
