//
//  NewExerciseView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/14/22.
//

import SwiftUI
import CoreData

struct NewExerciseView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var vm: ViewModel
    private var session: SessionEntity
    private var context: NSManagedObjectContext
    @State private var exerciseName = ""
    @State private var muscle: Muscle = .back
//    @State private var videoLink = ""
    
    init(session: SessionEntity, context: NSManagedObjectContext) {
        self.session = session
        self.context = context
    }
    
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
                
                Section {
                    saveButton
                }
                
//                Section(header: Text("Demonstartion Youtube video")) {
//                    TextField("", text: $videoLink)
//                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Cancel") {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .foregroundColor(.red)
                }
            }
            
            .navigationTitle("New Exercise")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var saveButton: some View {
        Button("Save exercise") {
            saveExercise()
            self.presentationMode.wrappedValue.dismiss()
        }
        .disabled(exerciseName.isEmpty)
    }
    
    func saveExercise() {
        let newExercise = ExerciseEntity(context: context)
        newExercise.id = UUID()
        newExercise.timeAdded = Date()
        newExercise.name = exerciseName
        newExercise.muscle = muscle.rawValue
        
        vm.addExercise(to: self.session, exercise: newExercise)
        
//        newExercise.originSession_ = session
//        try? context.save()
    }
}

//struct NewExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewExerciseView()
//    }
//}
