//
//  DefinedColours.swift
//  HaustierApp
//
//  Created by Mobile1 on 15.07.23.
//

import Foundation
import SwiftUI

extension Color {
    
    static let custom = Custom_Color()
    
    struct Custom_Color {
        
        let darkGreen = Color("DarkGreen")
        let green = Color("Green")
        let blueWhite = Color("BlueWhite")
        let burntOrange = Color("BurntOrange")
        let backgroundColor = Color("LightBeige")
        let lightOrange = Color("LightOrange")
        
    }
    
}

extension UIColor {
    
    static let customUI = Custom_UIColor()
    
    struct Custom_UIColor {
    
        let darkGreen = UIColor(named: "DarkGreen")
        let green = UIColor(named: "Green")
        let blueWhite = UIColor(named: "BlueWhite")
        let burntOrange = UIColor(named: "BurntOrange")
        let backgroundColor = UIColor(named: "LightBeige")
        let lightOrange = UIColor(named: "LightOrange")
        
    }
    
}
