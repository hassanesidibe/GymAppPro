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

    @State private var login_successfull = false
    var body: some Scene {
        WindowGroup {
            
//            LoginView()
            
//            Login(
            
            TabBar()
                .environment(\.managedObjectContext, CoreDataManager.shared.container.viewContext)
            
//            Testing_view()
            
//            Tutorial_card(for: .back)
//            New_tutorial_view()
        }
    }
}
