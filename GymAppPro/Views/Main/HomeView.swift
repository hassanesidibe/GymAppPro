//
//  HomeView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @ObservedObject var vm: ViewModel
    let viewContext: NSManagedObjectContext
    
    init() {
        self.viewContext = CoreDataManager.shared.persistentContainer.viewContext
        self.vm = ViewModel(context: viewContext)
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                
                
                GymSessionList(sessions: vm.sessions, context: viewContext)
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        HomeView()
    }
}

