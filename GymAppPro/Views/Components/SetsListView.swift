//
//  SetsListView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

//This view takes an exercise and displays the sets performed in a list
struct SetsListView: View {
    
    var exercise: Exercise
//    let sets: [ExerciseSet]
    var userColorTheme: Color = .red
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            /*List {
                
                Text(exercise.name).font(.title2)
                ForEach(exercise.sets) {exerciseSet in
                    
                    HStack {
                        Text("Set: \(exerciseSet.setNum)")
                            .bold()
                        
                        Spacer()
                        
                        Text("\(exerciseSet.weight, specifier: "%2.f")").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.weight > 0 ? "lbs " : "lb ") X ")
                        Text("\(exerciseSet.reps)").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.reps > 1 ? "reps" : "rep")")
                    }
                }
            }*/
            
            
            
            
            VStack(alignment: .leading) {
                
                Text(exercise.name).font(.title2)
                    .padding(.bottom)
                
                ForEach(exercise.sets) {exerciseSet in
                    
                    /*HStack {
                        Text("Set: \(exerciseSet.setNum)")
                            .bold()
                        
                        Spacer()
                        
                        Text("\(exerciseSet.weight, specifier: "%2.f")").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.weight > 0 ? "lbs " : "lb ") X ")
                        Text("\(exerciseSet.reps)").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.reps > 1 ? "reps" : "rep")")
                    }*/
                    
                    
                    HStack {
                        Text("Set: \(exerciseSet.setNum)")
                            .bold()
                        
                        Spacer()
                        
                        Text("\(exerciseSet.weight, specifier: "%2.f")").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.weight > 0 ? "lbs " : "lb ") X ")
                        Text("\(exerciseSet.reps)").foregroundColor(userColorTheme).font(.title3)
                        Text("\(exerciseSet.reps > 1 ? "reps" : "rep")")
                    }
                    .background(Color.gray.opacity(0.1))
                    .padding(0.1)
                    
                    
                }
            }
            .padding()
            .padding()
            
            
            
            
            
        }
//        .frame(height: 300)
    }
}

struct SetsListView_Previews: PreviewProvider {
    static var previews: some View {
        SetsListView(exercise: DemoModel.allGymSessions[0].exercises[0], userColorTheme: .red)
    }
}
