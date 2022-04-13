//
//  GymSessionList.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct GymSessionList: View {
    var sessions: [GymSession]
    
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
        GymSessionList(sessions: DemoModel.allGymSessions)
    }
}
