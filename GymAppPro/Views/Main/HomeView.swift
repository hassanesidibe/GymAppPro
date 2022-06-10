//
//  HomeView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
//    @ObservedObject var vm: ViewModel
    let viewContext: NSManagedObjectContext
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
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}

