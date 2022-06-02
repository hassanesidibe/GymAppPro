//
//  HomeView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var gymSessions: FetchedResults<GymSessionEntity>
    
    @ObservedObject var gymSessionVM: GymSessionVM
    
    init(vm: GymSessionVM) { self.gymSessionVM = vm }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
//                GymSessionList(sessions: DemoModel.allGymSessions)
//                GymSessionList(context: moc)
                ForEach(gymSessionVM.allGymSessions) {session in
                    
                    //Display the session here
                    GymSessionCard(session)
                    
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        HomeView(vm: GymSessionVM(context: context))
    }
}

