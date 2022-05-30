//
//  GymSession.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import Foundation

//This is my new model
struct GymSession {
    var sessionId = UUID()
    var date: Date
    var exercises: String
    private static var idexerciseIds = 0
    var numOfExercisePerformed: Int {
        exercisePerformedAsArray().count
    }
    init() {
        date = Date()
        exercises = ""
    }
    
    
    //The final version of this function should take the name and the muscle group of the exercise, and the muscle group should appear imediately after the exercise id.
    mutating func addExercise(_ newExercise: String) {
//        let id = UUID()  //this is the new exercise id
        
        let id = getNewId()
        
        if exercises.isEmpty {
//            exercises = id.uuidString
            exercises.append(contentsOf: "\(id);" + newExercise)
            
        } else {
            exercises.append(contentsOf: "\n\(id);\(newExercise)|")
        }
    }
    
    func exercisePerformedAsArray() -> [String.SubSequence] {
        let exerciseArray = exercises.split(separator: "\n")
        return exerciseArray
    }
    
    mutating func addSet(to exeriseId: String, weight: String, reps: String) {
        
        var exerciseArray = exercises.split(separator: "\n")
        
        //first find the row index of the set that matches with the id in the split exercise array
        for i in exerciseArray.indices {
            if exerciseArray[i].contains(exeriseId) {
               //Append the exercise set to this index of the exercise array
                exerciseArray[i] = exerciseArray[i] + "\(weight)x\(reps),"
            }
        }
        //Convert the exercise array back to one String to be stored in the exercises variable of the struct
        exercises = exerciseArray.joined(separator: "\n")
        
    }
    
    private mutating func getNewId() ->Int {
        GymSession.idexerciseIds = GymSession.idexerciseIds + 1
        return GymSession.idexerciseIds
    }
}



/*
struct GymSession: Identifiable {
    let id = UUID()
    let date = Date()
    var exercises: [Exercise]
    
    mutating func newExercise(_ name: String, muscle: Muscle) {
        let newExercise = Exercise(name, muscle)
        exercises.append(newExercise)
    }
    
    func getDateAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self.date)
    }
}

//DemoModel.allSessions[0].exercercises[0]

struct DemoModel {
    
    static var allGymSessions: [GymSession] = [
        GymSession(exercises: [
            Exercise("Lat pulldown", .back, sets: DemoModel.backDemoSet), Exercise("Leg curl", .hamstring, sets: DemoModel.legDemoSet), Exercise("Seated Row", .back, sets: DemoModel.backDemoSet), Exercise("Straight arm pull down", .back), Exercise("Dumbell biceps curl", .biceps, sets: DemoModel.bicepsDemoSet), Exercise("Machine biceps curl", .biceps, sets: DemoModel.bicepsDemoSet), Exercise("Cable biceps curl", .biceps, sets: DemoModel.bicepsDemoSet), Exercise("Machine dips", .tricep, sets: DemoModel.tricepsDemoSet),Exercise("Cable reverse fly", .shoulder, sets: DemoModel.shoulderDemoSet)
        ]),
        
        GymSession(exercises: [
            Exercise("Bech press", .chest), Exercise("Incline bench press", .chest), Exercise("Decline bench press", .chest), Exercise("Machine fly", .chest),
            Exercise("Machine dips", .tricep), Exercise("Cable tricep pushdown", .tricep), Exercise("EZ bar skull crusher", .tricep)
        ]),
        
        GymSession(exercises: [
            Exercise("Leg press", .legs), Exercise("Squat", .legs), Exercise("Lunges", .legs), Exercise("Leg curl", .legs),
            Exercise("Military press", .shoulder), Exercise("Cable lateral raise", .shoulder), Exercise("Machine reverse fly", .shoulder)
        ]),
        
        GymSession(exercises: [
            Exercise("Military press", .shoulder), Exercise("Dumbell lateral raise", .shoulder), Exercise("Cable reverse fly", .shoulder), Exercise("Dumbell front raise", .shoulder),
            Exercise("Machine biceps curl", .biceps), Exercise("Dumbell biceps curl", .biceps)
        ]),
        
        GymSession(exercises: [
            Exercise("Calf raise", .calf), Exercise("Donkey calf raise", .calf), Exercise("Cable reverse fly", .shoulder), Exercise("Dumbell front raise", .shoulder),
            Exercise("Machine biceps curl", .biceps), Exercise("Barbell curl", .biceps)
        ]),
        
        GymSession(exercises: [
            Exercise("Machine dips", .tricep), Exercise("Dumbell lateral raise", .shoulder), Exercise("Cable reverse fly", .shoulder), Exercise("Dumbell front raise", .shoulder),
            Exercise("Machine biceps curl", .biceps), Exercise("Leg press", .legs)
        ])
    ]
    
    
    static var chestDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 100, reps: 16), ExerciseSet(setNum: 2, weight: 150, reps: 14), ExerciseSet(setNum: 3, weight: 220, reps: 10), ExerciseSet(setNum: 4, weight: 250, reps: 8), ExerciseSet(setNum: 5, weight: 315, reps: 3)
    ]
    
    static var backDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 100, reps: 16), ExerciseSet(setNum: 2, weight: 150, reps: 14), ExerciseSet(setNum: 3, weight: 180, reps: 10), ExerciseSet(setNum: 4, weight: 200, reps: 8), ExerciseSet(setNum: 5, weight: 220, reps: 3)
    ]
    
    static var legDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 300, reps: 16), ExerciseSet(setNum: 2, weight: 405, reps: 14), ExerciseSet(setNum: 3, weight: 500, reps: 10), ExerciseSet(setNum: 4, weight: 700, reps: 8)
    ]
    
    static var bicepsDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 100, reps: 16), ExerciseSet(setNum: 2, weight: 120, reps: 14), ExerciseSet(setNum: 3, weight: 150, reps: 10)
    ]
    
    static var shoulderDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 100, reps: 16), ExerciseSet(setNum: 2, weight: 120, reps: 14), ExerciseSet(setNum: 3, weight: 150, reps: 10)
    ]
    
    static var tricepsDemoSet: [ExerciseSet] = [
        ExerciseSet(setNum: 0, weight: 100, reps: 16), ExerciseSet(setNum: 2, weight: 120, reps: 14), ExerciseSet(setNum: 3, weight: 150, reps: 10)
    ]
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////   */


