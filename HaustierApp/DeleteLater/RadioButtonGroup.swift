//
//  RadioButtonGroup.swift
//  HaustierApp
//
//  Created by Mobile1 on 21.06.23.
//

import SwiftUI

struct RadioButtonGroup: View {
    var buttonGroupLabel: String
    var buttonLabels: [String]
    
    init(buttonGroup: String, buttonValues: [String]) {
        self.buttonGroupLabel = buttonGroup
        self.buttonLabels = buttonValues
    }
    
    var body: some View {
        Text(buttonGroupLabel)
        ForEach(buttonLabels, id: \.self){ label in
            RadioButton(label: label)
            
        }
    }
}

struct RadioButtonGroup_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonGroup(buttonGroup: "previewValue", buttonValues: ["value1", "value2"])
    }
}
