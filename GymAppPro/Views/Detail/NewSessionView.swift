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
    @EnvironmentObject var vm: ViewModel
    let context: NSManagedObjectContext
    @State private var sessionName = ""
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var body: some View {
        NavigationView {
            
            Form {
                TextField("Name", text: $sessionName)
                
                Button("Save") {
                    createSession()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .disabled(sessionName.isEmpty)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("New Session")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func createSession() {
        
//        SessionEntity.newSession(name: sessionName, context: context)
        vm.newSession(sessionName)
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
