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
    
    func addExercise(to session: SessionEntity, name: String, muscle: Muscle) {
        let newExercise = ExerciseEntity(context: self.context)
        newExercise.id = UUID()
        newExercise.timeAdded = Date()
        newExercise.name = name
        newExercise.muscle = muscle.rawValue
        
        ExerciseEntity.newExercise(session, exercise: newExercise, context: self.context)
//        sessions = SessionEntity.getAllSessions(context: self.context)
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
    
    func progress(for muscle: Muscle, from startDate: Date, to endDate: Date) -> [ExerciseEntity] {
        print("PROGRESS FUNCTION HAS BEEN CALLED")
        
        /*let allExercises_forMuscle = ExerciseEntity.allExercise(in: self.context).filter { $0.unwrappedMuscle == muscle.rawValue } */ //returns all exercises for the specified muscle
        
        let allExercises_forMuscle = ExerciseEntity.allExercise(in: self.context)
        
        //ORIGINAL
//        let filtered_exercises = allExercises_forMuscle.filter { ($0.timeAdded! >= startDate) &&
//                                                                 ($0.timeAdded! <= endDate ) &&
//                                                                 ($0.unwrappedMuscle == muscle.rawValue)
//                                                                }
        
        //FOR TESTIN PURPOSE
        let exercises = allExercises_forMuscle.filter { ($0.timeAdded! >= startDate) &&
                                                                 ($0.unwrappedMuscle == muscle.rawValue)
                                                                } //This will return all the exercises for the muscle group parameter, in the date range specified
        
        var exercises_withoutDuplicates = [ExerciseEntity]()
        //remove the duplicates from the array
        for index in exercises.indices {
            
            if !exercises_withoutDuplicates.contains(where: {$0.id! == exercises[index].id! }) {
                exercises_withoutDuplicates.append(exercises[index])
            }
        }
        
        
//        EVERYTHING ABOVE THIS LINE IS WORKING PROPERLY
        
        
        
        print("There are \(exercises_withoutDuplicates.count) matching exercise")
        
        for index in exercises_withoutDuplicates.indices {
            print("\(exercises_withoutDuplicates[index].unwrappedName), id: \(exercises_withoutDuplicates[index].id!)")
        }
        
        return exercises
        
//        var weightProgress = [Double]()
        
        
        //loop over the filtered exercises and add the sets info (weight x reps) to the array that will be returned
//        for index in filtered_exercises.indices {
//
//        }
        
//        return weightProgress
    }
    
    
    
}
