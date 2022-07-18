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
            
//            ExerciseTutorialView()
            New_tutorial_view()
                .tabItem {
                    Label("Tutorial", systemImage: "brain.head.profile")
                }
            
            ProgressView()
                .environmentObject(vm)
                .tabItem {
                    Label("Progress", systemImage: "chart.line.uptrend.xyaxis")
                }
            
            SettingsView()
                .environmentObject(vm)
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

