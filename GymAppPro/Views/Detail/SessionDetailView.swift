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
    
    init(session: SessionEntity, context: NSManagedObjectContext) {
        self.session = session
        self.context = context
        self.exercises = ExerciseEntity.allExercisesForSession(session, context: context)
    }
    
    var body: some View {
        
        VStack {
            //Place Session Image here
            
            Text(session.unwrappedShortName)
            
            ForEach(exercises) {exercise in
                //Display the exercise title
//                Text(exercise.unwrappedName)
                
                ExerciseDetailView(exercise: exercise, context: context)
                
            }
            
        }
       
//        ScrollView {
//                //Use asyncImage in a loop to display the images for all the muscles the user worked on during that gym session.
//            GymSessionMuscleImages(session: session)
//
//            musclesNameView
//
//            VStack {
//                ForEach(session.exercises) {exercise in
//                    SetsListView(exercise: exercise)
//                }
//            }
//        }
        
    }
}

//struct SessionDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SessionDetailView(session: DemoModel.allGymSessions[0])
//    }
//}
