//
//  ViewModel.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/8/22.
//

import Foundation
import CoreData

class ViewModel: ObservableObject {
    
    private var context: NSManagedObjectContext
    @Published var sessions: [SessionEntity]
    @Published var allSets: [SetEntity]
    @Published var allExercise: [ExerciseEntity]
    
    @Published var progressReport: [(date: String, totalWeight: Double)] = []  //returns an array of tupple to the progress view to be display
    
    init(context: NSManagedObjectContext) {
        self.context = context
        sessions = SessionEntity.getAllSessions(context: context)
        allSets = SetEntity.all(context: context)
        allExercise = ExerciseEntity.allExercise(in: context)
    }
    
    func newSession(_ shortName: String) {
        SessionEntity.newSession(sessionName: shortName, context)
        sessions = SessionEntity.getAllSessions(context: context)
    }
    
    func addExercise(to session: SessionEntity, name: String, muscle: Muscle) {
        ExerciseEntity.newExercise(session, name, muscle, context: self.context)
        allExercise = ExerciseEntity.allExercise(in: self.context)
    }
    
    func addSet(to exercise: ExerciseEntity, weight: Double, reps: Double) {
        SetEntity.newSet(weight: weight, reps: reps, addTo: exercise, context: self.context)
        sessions = SessionEntity.getAllSessions(context: self.context)
        allSets = SetEntity.all(context: self.context)
        allExercise = ExerciseEntity.allExercise(in: self.context)
    }
    
    func getAllSetsForExercise(_ exercise: ExerciseEntity) -> [SetEntity] {
        let result = allSets.filter {$0.setOrigin_ == exercise }
        return result
//        SetEntity.getAllSetsForExercise(exercise, context: self.context)
    }
    
    func getAllExercise(for session: SessionEntity) -> [ExerciseEntity] {
        print("HELLO FROM getAlExercise()")
        return ExerciseEntity.allExercisesForSession(session, context: self.context)
    }
    
    
    
    
    //TESTING PROGRESS VIEW FUNCTIONS
//    func progress(for muscle: Muscle, from startDate: Date, to endDate: Date) -> [Double] {
    
    //the function should return something similar to this [(date: String, summation: Double)]  //the string will be the date and the double will be the sum of the sets and weight performed during that exercise
    
    func progress(for muscle: Muscle, from startDate: Date, to endDate: Date) {
        print("\nPROGRESS FUNCTION HAS BEEN CALLED")
        
        progressReport = []  //Clear the variable
        progressReport = ExerciseEntity.calculate_progress(for: muscle, from: startDate, to: endDate, in: self.context)
    }
    
    
    
}
