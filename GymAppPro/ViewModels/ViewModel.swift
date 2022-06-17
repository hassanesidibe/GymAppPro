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
    
    func addExercise(to session: SessionEntity, exercise: ExerciseEntity) {
        ExerciseEntity.newExercise(session, exercise: exercise, context: self.context)
        sessions = SessionEntity.getAllSessions(context: self.context)
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
        ExerciseEntity.allExercisesForSession(session, context: self.context)
    }
}
