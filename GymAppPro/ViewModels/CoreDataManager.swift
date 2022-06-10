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
    let container: NSPersistentContainer
    
    init() {
        print("Hello Hassane from core data manager")
        
        container = NSPersistentContainer(name: "GymAppProCoreDataModel")
        container.loadPersistentStores {desciption, error in
            if let error = error {
                print("Error loading Core data: \(error)")
                return
            }
        }
    }
}
