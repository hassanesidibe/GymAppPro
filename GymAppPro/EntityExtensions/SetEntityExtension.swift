//
//  SetEntityExtension.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/8/22.
//

import Foundation
import CoreData


extension SetEntity {
    
    static func newSet(weight: Double, reps: Double, addTo originExercise: ExerciseEntity, context: NSManagedObjectContext) {
        let newSet = SetEntity(context: context)
        newSet.id = UUID()
//        newSet.info = "\(weight)X\(reps)"
        newSet.weight = weight
        newSet.reps = reps
        newSet.setOrigin_ = originExercise
        try? context.save()
    }
    
    static func getAllSetsForExercise(_ exercise: ExerciseEntity, context: NSManagedObjectContext) -> [SetEntity] {
        let request = NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
        request.predicate = NSPredicate(format: "id = %@", exercise.id! as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "timeAdded", ascending: false)]
        
        let exercises = (try? context.fetch(request)) ?? []
        
        if let exerciseEntity = exercises.first {
            let setsToReturn = Array(exerciseEntity.setsPerformed)
            return setsToReturn
            
        } else {
            return []
        }
    }
    
    
}
