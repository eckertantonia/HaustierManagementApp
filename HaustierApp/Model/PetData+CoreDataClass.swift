//
//  PetData+CoreDataClass.swift
//  HaustierApp
//
//  Created by Mobile1 on 25.05.23.
//
//

import Foundation
import CoreData

@objc(PetData)
public class PetData: NSManagedObject {

}

extension PetData: BaseModel {
    static var all: NSFetchRequest<PetData> {
        let request = PetData.createFetchRequest()
        request.sortDescriptors = []
        return request
    }
}
