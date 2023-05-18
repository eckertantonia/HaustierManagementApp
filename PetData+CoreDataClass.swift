//
//  PetData+CoreDataClass.swift
//  HaustierApp
//
//  Created by Mobile1 on 24.05.23.
//
//

import Foundation
import CoreData

@objc(PetData)
public class PetData: NSManagedObject {

    @NSManaged var name: String?
    
    
}
