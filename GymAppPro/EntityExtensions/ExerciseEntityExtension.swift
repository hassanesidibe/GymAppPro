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
    
    var setsPerformed: Set<SetEntity> {
        get { (setsPerformed_ as? Set<SetEntity>) ?? []}
        
        set { setsPerformed_ = (newValue as NSSet) }
    }
    
    static func newExercise(_ session: SessionEntity, exercise: ExerciseEntity, context: NSManagedObjectContext) {
        let newExercise = ExerciseEntity(context: context)
        newExercise.id = exercise.id
        newExercise.name = exercise.name
        newExercise.originSession_ = session
        try? context.save()
    }
    
    //returns all excercise performed during session
    static func allExercisesForSession(_ session: SessionEntity, context: NSManagedObjectContext) -> [ExerciseEntity] {
        
        let request = NSFetchRequest<SessionEntity>(entityName: "SessionEntity")
        request.predicate = NSPredicate(format: "id = %@", session.id! as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "timeAdded", ascending: false)] //This will sort the request
        
        
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
}
