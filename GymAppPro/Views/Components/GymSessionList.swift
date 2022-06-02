//
//  GymSessionList.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct GymSessionList: View {
    
    private var context: NSManagedObjectContext
    private var sessionListViewMV
    
    init(context: NSManagedObjectContext) { self.context = context }
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
            ForEach(sessions) {session in
                
                NavigationLink(destination: SessionDetailView(session: session)) {
                    GymSessionCard(session: session)
//                    ScrollableGymSessionCard(exrecises: session.exercises)
                }
            }
        }
    }
}

struct GymSessionList_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = CoreDataManager.shared.persistentContainer.viewContext
        GymSessionList(context: context)
    }
}
