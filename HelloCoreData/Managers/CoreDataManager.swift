//
//  CoreDataManager.swift
//  HelloCoreData
//
//  Created by Joseph DeWeese on 2/19/22.
//

import Foundation
import CoreData

class CoreDataManager {
   //Initializing Core Data Model
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "WorkoutModel")
        persistentContainer.loadPersistentStores { (description, error ) in
            if let error = error {
                fatalError("Core Data failed to initialize \(error.localizedDescription)")
            }
        }
    }
}

