//
//  SetsListView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

//I NO LONGER NEED THIS VIEW, IT'S TASK IS BEING PERFORMED BY EXERCISE DETAIL VIEW
struct SetsListView: View {
    
    var exercise: ExerciseEntity
    private var context: NSManagedObjectContext
    var userColorTheme: Color
    @State private var showAddSetView = false
    
    init(_ exercise: ExerciseEntity, context: NSManagedObjectContext, theme: Color = .red) {
        self.exercise = exercise
        self.context = context
        self.userColorTheme = theme
    }
    
    var body: some View {
        
        let sets = SetEntity.getAllSetsForExercise(exercise, context: context)
        
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                
                HStack {
                    Text(exercise.unwrappedName).font(.title2)
                    Spacer()
                    showSheetForAdding_newSet_button
                }
                    .padding(.bottom)
                
                ForEach(sets) {exerciseSet in
                    
                    Text("\(exerciseSet.weight)lbs X \(exerciseSet.reps) reps")
                        .foregroundColor(userColorTheme)
                }
            }
            .padding()
            .padding()
            .sheet(isPresented: $showAddSetView) {
                NewSetView(self.exercise, context: self.context)
            }
        }
    }
    
    private var showSheetForAdding_newSet_button: some View {
        Button(action: {
            showAddSetView = true
        }) {
            Image(systemName: "plus")
        }
    }
    
    private func addSet() {
        
    }
    
}


//struct SetsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SetsListView()
//    }
//}
