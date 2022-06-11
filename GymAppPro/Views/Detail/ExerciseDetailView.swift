//
//  ExerciseDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

//This view takes an exercise and displays the sets performed
struct ExerciseDetailView: View {
    
    private var exercise: ExerciseEntity
    private var context: NSManagedObjectContext
//    @State private var isPresentedNewSetSheet = false
    
    init(exercise: ExerciseEntity, context: NSManagedObjectContext) {
//    init(exercise: ExerciseEntity) {
        self.exercise = exercise
        self.context = context
    }
    
    var body: some View {
        
        let sets = SetEntity.getAllSetsForExercise(exercise, context: context)
        
        ForEach(sets) {exerciseSet in
            HStack {
                Text("\(exerciseSet.weight, specifier: "%.0f")lb X \(exerciseSet.reps, specifier: "%.0f") reps")
                    .font(.title3)
                Spacer()
            }
        }
        .padding(.leading)
    }
    
//    var addNewSetButton: some View {
//        Button("New Set") {
//            isPresentedNewSetSheet = true
//        }
//    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: DemoModel.allGymSessions[0].exercises[0])  //first gym session and the first exercise in that gym session
//    }
//}

