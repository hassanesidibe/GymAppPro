//
//  SessionDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct SessionDetailView: View {
    var session: GymSession
    
    var body: some View {
       
        ScrollView {
                //Use asyncImage in a loop to display the images for all the muscles the user worked on during that gym session.
            GymSessionMuscleImages(session: session)
            
            musclesNameView
            
            HStack {
                Text("Back Dummy text:")
                    .fontWeight(.bold).padding()
                Spacer()
            }
        }
    }
    
    var musclesNameView: some View {
        HStack {
            Text("Back, Biceps, shoulders, Dummy text")
                .bold()
        }
        .font(.largeTitle)
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView(session: DemoModel.allGymSessions[0])
    }
}
