//
//  GymAppProApp.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/8/22.
//

import SwiftUI

@main
struct GymAppProApp: App {
//    let context = CoreDataManager.shared.persistentContainer.viewContext

    var body: some Scene {
        WindowGroup {
            /*ContentView()
                .environment(\.managedObjectContext, context)*/
            
//            TabBar()
//                .environment(\.managedObjectContext, context)
            
            HomeView()
                .environment(\.managedObjectContext, CoreDataManager.shared.container.viewContext)
        }
    }
}
