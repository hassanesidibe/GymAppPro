//
//  ExerciseDetailViewViewModel.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/2/22.
//

import Foundation
import CoreData

class ExerciseDetailViewViewModel: ObservableObject {
    
    private var session: GymSessionEntity
    private (set) var context: NSManagedObjectContext
    
    @Published var exercises: [ExerciseEntity] = []
    
    init(session: GymSessionEntity, context: NSManagedObjectContext) {
        self.session = session
        self.context = context
        getExercises()
    }
    
    func getExercises() {
        let request = NSFetchRequest<GymSessionEntity>(entityName: "GymSessionEntity")
        
        var allGymSessions: [GymSessionEntity] = []
        
        do {
            allGymSessions = try context.fetch(request)
            //here i need to find the GymSession that was passed to the initializer among all the gymSession array above
            
            let matchingSession = allGymSessions.first { $0.unwrapppedId == session.unwrapppedId }  //This is the session that matches the session passed to the initializer
            
            if let matchingSession = matchingSession {
                exercises = matchingSession.exerciseArray
            }
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
}
