//
//  BaseModel.swift
//  HaustierApp
//
//  Created by Mobile1 on 03.07.23.
//

import Foundation
import CoreData

protocol BaseModel {
    static var viewContext: NSManagedObjectContext {get}
    func save() throws
    func delete() throws
}

extension BaseModel where Self: NSManagedObject {
    
    static var viewContext: NSManagedObjectContext {
        PersistenceManager.shared.container.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
