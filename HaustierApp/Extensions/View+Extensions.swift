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
}
