//
//  VaccineJSONService.swift
//  HaustierApp
//
//  Created by Mobile1 on 20.07.23.
//

import Foundation
import SwiftUI

struct JSONVaccine: Codable {
    var disease: String
    var recommendedAge: String
    var protectedPeriod: String
    var notes: String
}

class VaccineJSONService: ObservableObject {
    @Published var vaccines = [JSONVaccine]()
    
    init() {
        loadVaccinesFromJSON()
    }
    
    func loadVaccinesFromJSON() {
            if let fileUrl = Bundle.main.url(forResource: "vaccines", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: fileUrl)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode([String: [JSONVaccine]].self, from: data)
                    if let vaccines = jsonData["vaccines"] {
                        self.vaccines = vaccines
                    }
                } catch {
                    print("Fehler beim JSON auslesen: \(error.localizedDescription)")
                }
            }
        }
}
