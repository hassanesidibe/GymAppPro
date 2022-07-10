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
                        
                        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    show_settings_view = true
                                }) {
                                    profile_image
                                }
                            }
                            
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
    
//    if vm.refreshUI
    
    mutating func update_context() {
        if shouldUpdateContext {
            self.viewContext = CoreDataManager.shared.container.viewContext
        }
    }
    
    var profile_image: some View {
            
         return   AsyncImage(url: URL(string: "https://static.independent.co.uk/s3fs-public/thumbnails/image/2020/03/30/12/shutterstock-editorial-138187a.jpg?quality=75&width=982&height=726&auto=webp")) { image in
                image
                    .resizable()
//                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
            } placeholder: {
                Image(systemName: "camera")
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

