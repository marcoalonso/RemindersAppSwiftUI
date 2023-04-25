//
//  CoreDataProvider.swift
//  RemindersApp
//
//  Created by Marco Alonso Rodriguez on 25/04/23.
//

import Foundation
import CoreData

class CoreDataProvider {
    static let shared = CoreDataProvider()
    let persistentContainer: NSPersistentContainer
    
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "RemindersModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error {
                fatalError("Error initializing RemindersModel \(error)")
            }
        }
    }
}
