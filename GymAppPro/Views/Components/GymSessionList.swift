//
//  GymSessionList.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct GymSessionList: View {
    
    private var sessions: [SessionEntity]
    private var context: NSManagedObjectContext
    
//    init(sessions: [SessionEntity], context: NSManagedObjectContext) {
//        self.sessions = sessions
//        self.context = context
//    }
    
    init(context: NSManagedObjectContext) {
        self.context = context
        self.sessions = SessionEntity.getAllSessions(context: context)
    }
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
            
            ForEach(sessions) {session in
                
                NavigationLink(destination: SessionDetailView(session: session, context: self.context)) {
                    Text(session.unwrappedShortName)
                }
            }
        }
    }
}

//struct GymSessionList_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let context = CoreDataManager.shared.persistentContainer.viewContext
//        GymSessionList(context: context)
//    }
//}
