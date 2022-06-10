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
    @State private var weight: String = ""
    @State private var reps: String = ""
    private var exercise: ExerciseEntity
    private var context: NSManagedObjectContext
    
    private var weightAsDouble: Double {
        Double(self.weight) ?? -1
    }
    
    private var repsAsDouble: Double {
        Double(self.reps) ?? -1
    }
    
    init(_ exercise: ExerciseEntity, context: NSManagedObjectContext) {
        self.exercise = exercise
        self.context = context
    }
    
    
    var body: some View {
        Form {
            TextField("Weight", text: $weight)
            TextField("Reps", text: $reps)
            Button("Add Set") {
                addSet()
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(weight.isEmpty || reps.isEmpty)
        }
    }
    
    private func addSet() {
        SetEntity.newSet(weight: weightAsDouble, reps: repsAsDouble, addTo: exercise, context: context)
    }
}

//struct NewSetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewSetView()
//    }
//}
