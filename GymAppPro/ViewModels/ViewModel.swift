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
    
    init(context: NSManagedObjectContext) {
        self.context = context
        sessions = SessionEntity.getAllSessions(context: context)
    }
    
    func newSession(_ shortName: String) {
        SessionEntity.newSession(sessionName: shortName, context)
        sessions = SessionEntity.getAllSessions(context: context)
    }
    
    func addExercise(to session: SessionEntity, exercise: ExerciseEntity) {
        
    }
    
}
