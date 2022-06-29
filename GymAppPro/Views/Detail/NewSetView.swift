//
//  NewSetView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/9/22.
//

import SwiftUI
import CoreData

struct NewSetView: View {
    @Environment(\.presentationMode) private var presentationMode
    private let exercise: ExerciseEntity
    @EnvironmentObject var vm: ViewModel
    @State private var weight: String = ""
    @State private var reps: String = ""
    
    @State private var title: String = "Place holder"
    
    private var weightAsDouble: Double {
        Double(self.weight) ?? -1
    }
    
    private var repsAsDouble: Double {
        Double(self.reps) ?? -1
    }
    
    
    init(addSetTo exercise: ExerciseEntity) {
        self.exercise = exercise
    }
    
    
    var body: some View {
        NavigationView {
            
            Form {
                
                Section(content: {
                    TextField("Weight", text: $weight)
                    TextField("Reps", text: $reps)
                    Button("Add Set") {
                        addSet()
                        title = "Reset to Dummy text"
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .disabled(weight.isEmpty || reps.isEmpty)
                    
                }, header: {
//                        Text(exercise.unwrappedName)
                    Text(matchingExercise(to: self.exercise).unwrappedName)
                })
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            .navigationTitle("New Set")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func matchingExercise(to exercise: ExerciseEntity) -> ExerciseEntity {
        let mathingExercises = vm.allExercise.filter {$0.id == exercise.id }
        if let matching = mathingExercises.first {
            return matching
        }
        
        fatalError("Enable to find a matching exercise\nError occured in NewSetView()")
    }
    
    private func addSet() {
        vm.addSet(to: self.exercise, weight: weightAsDouble, reps: repsAsDouble)
    }
}

//struct NewSetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewSetView()
//    }
//}
