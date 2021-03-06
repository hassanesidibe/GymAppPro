//
//  SessionDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData


//This view shows the details of a Gym session. So it will display the excercises performed with the sets performed
struct SessionDetailView: View {
    @EnvironmentObject var vm: ViewModel
    
    private var session: SessionEntity
    @State private var showNewExerciseView = false
    @State private var showNewSetView = false
    
    init(session: SessionEntity) {
        self.session = session
    }
    
    var body: some View {
        
            ScrollView {
                Spacer(minLength: -35)
                sessionImage
                HStack {
                    sessionName
                    Spacer()
                    
                }
                .padding([.leading, .trailing])
                
                VStack {
                    
                    ForEach(getExercisesForSession()) { exercise in
                        
                        ExerciseDetailView(exercise: exercise)
                            .environmentObject(vm)
                            .padding(.bottom)
                    }
                    
                }
                .padding()
                
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                                showNewExerciseView = true
                        } label: {
                            VStack {
                                Image(systemName: "plus")
                                Text("New exercise")
                            }
                        }
                        .sheet(isPresented: $showNewExerciseView) {
                            NewExerciseView(session: session)
                                        .environmentObject(vm)
                        }

                    }
                }
                
            }
        
    }
    
    private func takeProgressPhoto() {
        //ALLOW THE USER TO TAKE A PROGRESS IMAGE FOR THE SESSION
        
        
        
    }
    
    private func getExercisesForSession() -> [ExerciseEntity] {
        return vm.allExercise.filter { $0.originSession_ == self.session }
    }
    
    var AddNewExerciseButton: some View {
        Button("New Exercise") {
            showNewExerciseView = true
        }
    }
    
    var sessionName: some View {
        VStack(alignment: .leading) {
            Text(session.unwrappedShortName)
                .font(.largeTitle)
                .bold()
        }
    }
    
    var sessionImage: some View {
        AsyncImage(url: URL(string: getImageURL(for: session))) {image in
            image
                .resizable()
                .frame(height: 300)
                .scaledToFit()
//                .scaledToFill()
            
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.white).opacity(0.8)
        }
    }
}




//struct SessionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionDetailView(session: DemoModel.allGymSessions[0])
//    }
//}
