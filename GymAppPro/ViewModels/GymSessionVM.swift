//
//  GymSessionVM.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/2/22.
//

import Foundation
import CoreData


class GymSessionVM: ObservableObject {
    
    private (set) var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        getGymSessions()
    }
    
    @Published var allGymSessions: [GymSessionEntity] = []
    
    func getGymSessions() {
        let request = NSFetchRequest<GymSessionEntity>(entityName: "GymSessionEnity")
        
        do {
            allGymSessions = try context.fetch(request)
            
        } catch let error  {
                print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func newSession() {
        let id = UUID()
        let date = Date()
        
        let newSession = GymSessionEntity(context: context)
        newSession.id = id
        newSession.date = date
        
        try? context.save()
    }
    
    func deleteSession(_ session: GymSessionEntity) {
//        context.delete(session)
        
    }
}
