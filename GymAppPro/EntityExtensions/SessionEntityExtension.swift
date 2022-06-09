//
//  SessionEntityExtension.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/8/22.
//

import Foundation
import CoreData

extension SessionEntity {
    
    var exercises: Set<ExerciseEntity> {
        get { (exercises_ as? Set<ExerciseEntity>) ?? [] }
        
        set { exercises_ = (newValue as NSSet)}
    }
    
    var unwrappedShortName: String {
        shortName ?? "Unknown short name"
    }
    
    static func withId(_ sessionId: UUID, context: NSManagedObjectContext) -> SessionEntity {
        //look up the GymSession
        let request = NSFetchRequest<SessionEntity>(entityName: "SessionEntity")
        request.predicate = NSPredicate(format: "id = %@", sessionId as CVarArg)
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)] //This will sort the request
        
        let sessions = (try? context.fetch(request)) ?? []  //Sorting the request will return an array instead of an NSSet
        
        //if found return it
        if let sessionEntity = sessions.first {
            return sessionEntity
            
        } else {
            //create a new SessionEntity and return it
            let newSession = SessionEntity(context: context)
            newSession.id = sessionId
            newSession.date = Date()
            try? context.save()
        }
        
        fatalError()
    }
    
    static func getAllSessions(context: NSManagedObjectContext) -> [SessionEntity] {
        let request = NSFetchRequest<SessionEntity>(entityName: "SessionEntity")
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        let sessions = (try? context.fetch(request)) ?? []
        return sessions
    }
    
    static func newSession(sessionName: String, _ context: NSManagedObjectContext) {
        let session = SessionEntity(context: context)
        session.id = UUID()
        session.date = Date()
        session.shortName = sessionName
        try? context.save()
    }
}
