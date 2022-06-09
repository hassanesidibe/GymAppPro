//
//  CoreDataManager.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/2/22.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "GymAppProCoreDataModel")
        persistentContainer.loadPersistentStores {desciption, error in
            if let error = error {
                print("Error loading Core data: \(error)")
                return
            }
        }
    }
}
