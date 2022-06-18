//
//  TabBar.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct TabBar: View {
    @StateObject var vm: ViewModel = ViewModel(context: CoreDataManager.shared.container.viewContext)
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(vm)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            ProgressView()
                .environmentObject(vm)
                .tabItem {
                    Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                }
            
//            NewSessionView()
//                .tabItem {
//                    Label("New session", systemImage: "plus")
//                }
            
            ExerciseTutorialView()
                .tabItem {
                    Label("Tutorial", systemImage: "brain.head.profile")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
            
    }
}

