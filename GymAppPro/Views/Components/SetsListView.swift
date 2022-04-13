//
//  SetsListView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

//This view takes an array of exercise sets and displays them in a list
struct SetsListView: View {
    
    var exercise: Exercise
//    let sets: [ExerciseSet]
    var userColorTheme: Color
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List {
                
                Text(exercise.name).font(.title2)
                ForEach(exercise.sets) {exerciseSet in
                    
                    HStack {
                        Text("Set: \(exerciseSet.setNum)")
                            .bold()
                        
                        Spacer()
                        
    //                    Text("\(exerciseSet.weight, specifier: "%2.f") lb(s) X \(exerciseSet.reps) rep(s)")
                        Text("\(exerciseSet.weight, specifier: "%2.f")").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.weight > 0 ? "lbs " : "lb ") X ")
                        Text("\(exerciseSet.reps)").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.reps > 1 ? "reps" : "rep")")
                    }
                }
            }
        }
        .padding()
    }
}

struct SetsListView_Previews: PreviewProvider {
    static var previews: some View {
        SetsListView(exercise: DemoModel.allGymSessions[0].exercises[0], userColorTheme: .red)
    }
}
