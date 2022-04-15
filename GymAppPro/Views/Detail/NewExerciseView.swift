//
//  NewExerciseView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/14/22.
//

import SwiftUI

struct NewExerciseView: View {
    @State private var exerciseName = ""
    @State private var muscle: Muscle = .back
    @State private var videoLink = ""
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Exercise name")) {
                    TextField("", text: $exerciseName)
                }
                
                Section(header: Text("Muscle")) {
                    Picker("", selection: $muscle) {
                        ForEach(Muscle.allCases, id: \.self) {muscle in
                            Text(muscle.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Section(header: Text("Demonstartion Youtube video")) {
                    TextField("", text: $videoLink)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                       //Add the exercise to the gym session that the add exercise was pressed for, and dismiss this view
                        
                        
                    }) {
                        Text("Done")
                    }
                }
            }
        }
    }
}

struct NewExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        NewExerciseView()
    }
}
