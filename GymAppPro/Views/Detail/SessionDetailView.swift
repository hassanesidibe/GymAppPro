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
                sessionImage
                HStack {
                    sessionName
                    Spacer()
                    Button("New exercise") {
                        showNewExerciseView = true
                    }
                    .sheet(isPresented: $showNewExerciseView) {
                        NewExerciseView(session: session)
                                    .environmentObject(vm)
                    }
                    
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
                
            }
        
        
       
//        ScrollView {
//                //Use asyncImage in a loop to display the images for all the muscles the user worked on during that gym session.
//            GymSessionMuscleImages(session: session)
//
//            musclesNameView
//            VStack {
//                ForEach(session.exercises) {exercise in
//                    SetsListView(exercise: exercise)
//                }
//            }
//        }
        
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
                .scaledToFit()
            
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
