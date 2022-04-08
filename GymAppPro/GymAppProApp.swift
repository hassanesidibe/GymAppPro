//
//  GymAppProApp.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/8/22.
//

import SwiftUI

@main
struct GymAppProApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
