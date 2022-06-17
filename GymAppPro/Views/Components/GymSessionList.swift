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
//                        .frame(width: 100, height: 100)
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
