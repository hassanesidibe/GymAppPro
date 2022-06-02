//
//  ExerciseDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

//This view takes an exercise and displays the details about the exercise, including the sets that were performed
struct ExerciseDetailView: View {
    
    @ObservedObject var exerciseDetailViewMV: ExerciseDetailViewViewModel
    private var context: NSManagedObjectContext
    
//    init(session: GymSessionEntity, vm: ExerciseDetailViewViewModel) {
    init(session: GymSessionEntity, context: NSManagedObjectContext) {
        self.context = context
        self.exerciseDetailViewMV = ExerciseDetailViewViewModel(session: session, context: context)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(exerciseDetailViewMV.exercises) {execise in
                    Text(execise.unwrappedInfo)
                }
            }
        }
    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: DemoModel.allGymSessions[0].exercises[0])  //first gym session and the first exercise in that gym session
//    }
//}

