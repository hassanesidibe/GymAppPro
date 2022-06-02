//
//  ExerciseEntity+CoreDataProperties.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/2/22.
//
//

import Foundation
import CoreData


extension ExerciseEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ExerciseEntity> {
        return NSFetchRequest<ExerciseEntity>(entityName: "ExerciseEntity")
    }

    @NSManaged public var info: String?
    @NSManaged public var origin: GymSessionEntity?

}

extension ExerciseEntity : Identifiable {

}
