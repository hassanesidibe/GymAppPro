//
//  GymSessionEntity+CoreDataProperties.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/2/22.
//
//

import Foundation
import CoreData


extension GymSessionEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GymSessionEntity> {
        return NSFetchRequest<GymSessionEntity>(entityName: "GymSessionEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var exercises: NSSet?
    
    public var unwrappedDate: Date {
        date ?? Date()
    }
    
    public var unwrapppedId: UUID {
        id ?? UUID()
    }
    
    var exerciseArray: [ExerciseEntity] {
        let set = exercises as? Set<ExerciseEntity> ?? []
        
        return set.sorted {
            $0.unwrappedInfo < $1.unwrappedInfo
        }
    }
    
    

}

// MARK: Generated accessors for exercises
extension GymSessionEntity {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: ExerciseEntity)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: ExerciseEntity)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}

extension GymSessionEntity : Identifiable {

}
