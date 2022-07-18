//
//  GymSessionList.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData


struct GymSessionList: View {
    
    @EnvironmentObject var vm: ViewModel
    private var context: NSManagedObjectContext
    @State private var showDeleteMessage = false
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
            
            ForEach(vm.sessions) {session in
                
                NavigationLink(destination:
                                SessionDetailView(session: session)
                                        .environmentObject(vm)
                ) {
                    GymSessionCard(session)
                    
                }
                .contentShape(Rectangle())
                .simultaneousGesture(LongPressGesture().onEnded({ _ in
                    //The two lines below are for the heaptic feedback
                    let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                        impactHeavy.impactOccurred()
                    showDeleteMessage = true
                }))
                .alert("Delete Session", isPresented: $showDeleteMessage) {
                    Button("Delete", role: .destructive) {
                        //Delete sesssion here, MORE CODE TO COME
                        withAnimation {
                            vm.delete(session)
                        }
                        
                    }
                    
                    Button("Cancel", role: .cancel) {}
                }
            }
            
        }
    }
}


//struct GymSessionList_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let context = CoreDataManager.shared.persistentContainer.viewContext
//        GymSessionList(context: context)
//    }
//}
