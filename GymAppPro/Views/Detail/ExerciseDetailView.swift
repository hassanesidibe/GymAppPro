//
//  ExerciseDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

//This view takes an exercise and displays the details about the exercise, including the sets that were performed
struct ExerciseDetailView: View {
    var exercise: Exercise
    
    var body: some View {
        Text("Exercise detail")
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: DemoModel.allGymSessions[0].exercises[0])  //first gym session and the first exercise in that gym session
    }
}

