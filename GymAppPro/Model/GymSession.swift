//
//  GymSession.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import Foundation

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


struct DemoModel {
    
    static var allGymSessions: [GymSession] = [
        GymSession(exercises: [
            Exercise("Lat pulldown", .back), Exercise("Leg curl", .hamstring), Exercise("Seated Row", .back), Exercise("Straight arm pull down", .back), Exercise("Dumbell biceps curl", .biceps), Exercise("Machine biceps curl", .biceps), Exercise("Cable biceps curl", .biceps), Exercise("Machine dips", .tricep),Exercise("Cable reverse fly", .shoulder)
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
    
    
}


