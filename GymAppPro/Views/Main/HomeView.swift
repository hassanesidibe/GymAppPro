//
//  HomeView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
//
    
    @EnvironmentObject var vm: ViewModel
    var viewContext: NSManagedObjectContext
    @State private var showNewSessionView = false
    @State private var show_settings_view = false
    @State private var shouldUpdateContext = false
    @State private var refreshUI = false
    
    init() {
        self.viewContext = CoreDataManager.shared.container.viewContext
    }
    
    var body: some View {
                
                NavigationView {
                        ScrollView {
                            GymSessionList(context: viewContext)
                                .environmentObject(vm)
                        }
                        .padding(.top)
                        
                        
                        .toolbar {
                            
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: { showNewSessionView = true }) {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                    
                        .sheet(isPresented: $showNewSessionView) {
                            
                            NewSessionView(context: viewContext)
                                .environmentObject(vm)
                        }
                        .sheet(isPresented: $show_settings_view) {
                            SettingsView()
                                .environmentObject(vm)
                        }
                    .navigationTitle("Home")
                    .navigationViewStyle(StackNavigationViewStyle())
                }
        
    }
}










/* ORIGINAL CODE
struct HomeView: View {
    
//    @ObservedObject var vm: ViewModel
    var viewContext: NSManagedObjectContext
    @State private var showNewSessionView = false
    
    init() {
        self.viewContext = CoreDataManager.shared.container.viewContext
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                GymSessionList(context: viewContext)
            }
            
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showNewSessionView = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationTitle("Home")
            .sheet(isPresented: $showNewSessionView) {
                
                NewSessionView(context: viewContext)
            }
        }
    }
}*/

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}

