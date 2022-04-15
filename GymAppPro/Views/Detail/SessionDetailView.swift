//
//  SessionDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct SessionDetailView: View {
    var session: GymSession
    @State private var showNewExerciseView = false
    
    var body: some View {
       
//        ScrollView {
//                //Use asyncImage in a loop to display the images for all the muscles the user worked on during that gym session.
//            GymSessionMuscleImages(session: session)
//
//            musclesNameView
//
//            VStack {
//                ForEach(session.exercises) {exercise in
//                    SetsListView(exercise: exercise)
//                }
//            }
//        }
        
        ScrollView {
            VStack {
                
//                sessionDateView
                GymSessionMuscleImages(session: session)
                
                VStack {
                    musclesNameView
                    
                    VStack {
                            ForEach(session.exercises) {exercise in
                                
                                if !exercise.sets.isEmpty {
                                    SetsListView(exercise: exercise)
                                }
                                
                            }
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    showNewExerciseView = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        
        .sheet(isPresented: $showNewExerciseView) {
            NewExerciseView()
        }
        .navigationTitle(Text(session.getDateAsString()))
        .navigationBarTitleDisplayMode(.inline)
        
    }
    
    /*
    var sessionDateView: some View {
        Text(session.getDateAsString())
            .font(.title3)
    }*/
    
   /* var newExerciseButton: some View {
        HStack {
            Spacer()
            Button(action: {
                //Present NewExerciseView
                showNewExerciseView = true
            }) {
                Image(systemName: "plus").font(.title)
                    .padding(.trailing)
            }
            .sheet(isPresented: $showNewExerciseView) {
                NewExerciseView()
            }
        }
    }*/
    
    var musclesNameView: some View {
        HStack {
            Text(allMusclesWorkedDuringSession(session.exercises))
                .font(.headline)
                .padding(.leading)
        }
        .font(.largeTitle)
    }
}

struct SessionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SessionDetailView(session: DemoModel.allGymSessions[0])
    }
}
