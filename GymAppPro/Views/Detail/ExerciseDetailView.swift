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
    
    private var exercise: ExerciseEntity
    private var context: NSManagedObjectContext
    @State private var isPresentedNewSetSheet = false
    
    init(exercise: ExerciseEntity, context: NSManagedObjectContext) {
        self.exercise = exercise
        self.context = context
    }
    
    var body: some View {
        
        let sets = SetEntity.getAllSetsForExercise(exercise, context: context)
        
        NavigationView {
            
            VStack {
                //place image here
                Text("Place nice image here")
                
                HStack {
                    Text(exercise.unwrappedName)
                    Spacer()
                    addNewSetButton
                }
                
                ForEach(sets) {exerciseSet in
                    Text("\(exerciseSet.weight)lb X \(exerciseSet.reps) reps")
                }
            }
        }
        .sheet(isPresented: $isPresentedNewSetSheet) {
            NewSetView(exercise, context: context)
        }
    }
    
    var addNewSetButton: some View {
        Button("New Set") {
            isPresentedNewSetSheet = true
        }
    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: DemoModel.allGymSessions[0].exercises[0])  //first gym session and the first exercise in that gym session
//    }
//}

