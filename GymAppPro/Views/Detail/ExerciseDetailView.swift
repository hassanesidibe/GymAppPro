//
//  ExerciseDetailView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

//This view takes an exercise and displays the sets performed
struct ExerciseDetailView: View {
    
    @EnvironmentObject var vm: ViewModel
    private var exercise: ExerciseEntity
    @State private var showNewSetView = false
    
    init(exercise: ExerciseEntity) {
        self.exercise = exercise
    }
    
    var body: some View {
//        let sets = vm.getAllSetsForExercise(exercise)
        
        VStack {
            
            HStack {
                exerciseTitle
                
                Spacer()
                showNewSetButton
                    .sheet(isPresented: $showNewSetView) {
                        NewSetView(addSetTo: exercise)
                            .environmentObject(vm)
                    }
            }
            
//            .padding()
            
//        ForEach(sets) {exerciseSet in
            ForEach(allSetsFor(exercise: self.exercise)) {exerciseSet in
                HStack {
                    Text("\(exerciseSet.weight, specifier: "%.0f")lb X \(exerciseSet.reps, specifier: "%.0f") reps")
                        .font(.title3)
                    Spacer()
                }
            }
//        .padding(.leading)
        }
        
    }
    
    var exerciseTitle: some View {
        Text(exercise.unwrappedName)
            .font(.title3)
            .bold()
            .foregroundColor(.red)
    }
    
    var showNewSetButton: some View {
        Button(action: {
            showNewSetView = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func allSetsFor(exercise: ExerciseEntity) -> [SetEntity] {
        return vm.allSets.filter { $0.setOrigin_ == exercise }
    }
}



//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView(exercise: DemoModel.allGymSessions[0].exercises[0])  //first gym session and the first exercise in that gym session
//    }
//}

