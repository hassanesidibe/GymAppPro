//
//  NewSessionView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct NewSessionView: View {
    @Environment(\.presentationMode) private var presentationMode
    let context: NSManagedObjectContext
    @State private var sessionName = ""
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var body: some View {
        Form {
            TextField("Name", text: $sessionName)
            
            Button("Save") {
                createSession()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(sessionName.isEmpty)
        }
    }
    
    func createSession() {
        
        SessionEntity.newSession(name: sessionName, context: context)
        print("createSession() was called")
        
//        let session = SessionEntity(context: context)
//        session.id = UUID()
//        session.date = Date()
//        session.shortName = sessionName
//        try? context.save()
    }
}

//struct NewSessionView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewSessionView()
//    }
//}
