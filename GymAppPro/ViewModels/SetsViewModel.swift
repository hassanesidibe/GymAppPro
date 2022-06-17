//
//  SetsViewModel.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/14/22.
//

import Foundation
import CoreData

class SetsViewModel: ObservableObject {
    
    private var context: NSManagedObjectContext
    @Published var sets: [SetEntity]
    
    init(context: NSManagedObjectContext) {
        self.context = context
        sets = SetEntity.all(context: context)
    }
    
    func newSet(weight: Double, reps: Double, origin: ExerciseEntity, context: NSManagedObjectContext) {
        let newSet = SetEntity(context: context)
        newSet.id = UUID()
        newSet.timeAdded = Date()
        newSet.weight = weight
        newSet.reps = reps
        newSet.setOrigin_ = origin
        try? context.save()
        self.sets = SetEntity.all(context: context)
    }
}
