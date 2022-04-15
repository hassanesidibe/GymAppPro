//
//  ExtensionsAndUtilities.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import Foundation

//This function takes a muscle enum as argument and return the image url string associated with that muscle
func getImageURL(for muscle: Muscle) -> String {
    switch muscle {
    case .chest:
        return MuscleImageLink.chest.rawValue
    case .tricep:
        return MuscleImageLink.tricep.rawValue
    case .back:
        return MuscleImageLink.back.rawValue
    case .biceps:
        return MuscleImageLink.biceps.rawValue
    case .legs:
        return MuscleImageLink.legs.rawValue
    case .shoulder:
        return MuscleImageLink.shoulder.rawValue
    case .abdominals:
        return MuscleImageLink.abdominals.rawValue
    case .hamstring:
        return MuscleImageLink.hamstring.rawValue
    case .quadriceps:
        return MuscleImageLink.quadriceps.rawValue
    case .calf:
        return MuscleImageLink.calf.rawValue
    case .glutes:
        return MuscleImageLink.glutes.rawValue
    case .trapezius:
        return MuscleImageLink.trapezius.rawValue
    }
}


func allMusclesWorkedDuringSession(_ exercises: [Exercise]) -> String {
    var namesString = ""
    
    for exercise in exercises {
        let newName = exercise.muscle.rawValue
        
        if !namesString.contains(newName) {
            
            namesString.append(newName + ",")
            
//            if namesString.isEmpty {
//                namesString.append(newName + ",")
//
//            }
        }
    }
    
    //removes the last comma in the muscle name list
    namesString.removeLast()
    
    return namesString
}
