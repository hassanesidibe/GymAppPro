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
    private var session: SessionEntity
    private var exercises: [ExerciseEntity]
    private var context: NSManagedObjectContext
    @State private var showNewExerciseView = false
    @State private var showNewSetView = false
    
    init(session: SessionEntity, context: NSManagedObjectContext) {
        self.session = session
        self.context = context
        self.exercises = ExerciseEntity.allExercisesForSession(session, context: context)
    }
    
    var body: some View {
        
            ScrollView {
                AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBsWaMMH2fU9E-0mtcDZzScolvVJ8Ly_T6vw&usqp=CAU")) {image in
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
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(session.unwrappedShortName)
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    Spacer()
                    Button("New exercise") {
                        showNewExerciseView = true
                    }
                    .sheet(isPresented: $showNewExerciseView) {
                        NewExerciseView(session: session, context: context)
                    }
                    
                }
                .padding([.leading, .trailing])
                
                
                VStack {
                    
                    ForEach(exercises) { exercise in
                        HStack {
                            Text(exercise.unwrappedName)
                                .font(.title3)
                                .bold()
                                .foregroundColor(.red)
                            
                            Spacer()
                            
                            Button(action: {
                                //show new NewSetView
                                showNewSetView = true
                            }) {
                                Image(systemName: "plus")
                            }
                        }
                        .padding()
                        
                        .sheet(isPresented: $showNewSetView) {
                            NewSetView(exercise, context: context)
                        }
                        
                        
                        
                        ExerciseDetailView(exercise: exercise, context: context)
//                        ExerciseDetailView(exercise: exercise)
                    }
                    
                }
                
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
    
    var AddNewExerciseButton: some View {
        Button("New Exercise") {
            showNewExerciseView = true
        }
    }
}



//struct SessionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionDetailView(session: DemoModel.allGymSessions[0])
//    }
//}
