//
//  ExerciseEntityExtension.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/8/22.
//

import Foundation
import CoreData

extension ExerciseEntity {
    
    var unwrappedName: String {
        name ?? "Unknown name"
    }
    
    var unwrappedMuscle: String {
        muscle ?? "Unknown muscle"
    }
    
    var setsPerformed: Set<SetEntity> {
        get { (setsPerformed_ as? Set<SetEntity>) ?? []}
        
        set { setsPerformed_ = (newValue as NSSet) }
    }
    
    static func newExercise(_ session: SessionEntity, exercise: ExerciseEntity, context: NSManagedObjectContext) {
        let newExercise = ExerciseEntity(context: context)
        newExercise.id = exercise.id
        newExercise.name = exercise.name
        newExercise.muscle = exercise.muscle
//        newExercise.timeAdded = Date()
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// TESTING PURPOSE
        ///CHOSING A DATE IN THE PAST
        var dates_toChoose_from = [Int]()
        for i in 1...60 {
            dates_toChoose_from.append(i)   //dates_toChoose_from will hold an array of int from 1 to 60, so that I can set the date of the new exercise to the past
        }
        
        let chosenDate_inThe_past = dates_toChoose_from.randomElement()
        newExercise.timeAdded = Date.go_inThe_past(by: chosenDate_inThe_past!, from: Date())
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    END OF TESTING
        
        newExercise.originSession_ = session
        try? context.save()
    }
    
    //returns all excercise performed during session
    static func allExercisesForSession(_ session: SessionEntity, context: NSManagedObjectContext) -> [ExerciseEntity] {
        
        let request = NSFetchRequest<SessionEntity>(entityName: "SessionEntity")
        request.predicate = NSPredicate(format: "id = %@", session.id! as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)] //This will sort the request
        
        
        let sessions = (try? context.fetch(request)) ?? []  //Sorting the request will return an array instead of an NSSet
        
        //if found return it
        if let sessionEntity = sessions.first {
            
            let exercisesToReturn = Array(sessionEntity.exercises)
            return exercisesToReturn
            
        } else {
            //create a new SessionEntity and return it
            return []
        }
    }
    
    static func allExercise(in context: NSManagedObjectContext) -> [ExerciseEntity] {
        let request = NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
        let exercises = (try? context.fetch(request)) ?? []
        return exercises
    }
    
//    THIS IS WHERE IS STOPPED
    func calculateWeight() -> Double {
        var total: Double = 0
        
        let exercise_sets = (setsPerformed_ as? Set<SetEntity>) ?? []
        let sets_array = Array(exercise_sets)
        
        for index in sets_array.indices {
            let weight = sets_array[index].weight
            let reps = sets_array[index].reps
            total = total + (weight * reps)
        }
        
        return total
    }
}

