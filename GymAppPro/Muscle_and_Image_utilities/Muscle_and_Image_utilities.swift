//
//  Muscle_and_Image_utilities.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 6/10/22.
//

import Foundation

enum Muscle: String, CaseIterable {
    case chest = "Pectoralis Major"
    case tricep = "Triceps"
    case back = "Latissimus Dorsi"
    case biceps = "Biceps"
    case legs = "Legs"
    case shoulder = "Deltoid"
    case abdominals = "Abdominals"
    case hamstring = "Hamstring"
    case quadriceps = "Quadriceps"
    case calf = "Gastrocnemius"
    case glutes = "Gluteus maximus"
    case trapezius = "Trapezius"
    case fullBody = "Full body"
    
}

enum MuscleImageLink: String {
//    case chest = "https://c8.alamy.com/comp/D9NTCR/anatomy-of-male-pectoral-muscles-D9NTCR.jpg"
//    case chest = "https://miro.medium.com/max/1001/1*9OrxMWzC6ARoatL1rrufQg.jpeg"
    case chest = "https://fitbodybuzz.com/wp-content/uploads/2021/10/1-Chest-Workouts.jpg"
    case tricep = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBsWaMMH2fU9E-0mtcDZzScolvVJ8Ly_T6vw&usqp=CAU"
    case back = "https://cdn.shopify.com/s/files/1/1915/0785/files/seated-pulley-row-2-0_large.jpg?v=1585509781"
    case biceps = "https://cdn.shopify.com/s/files/1/1876/4703/articles/shutterstock_1931706245_1000x.jpg?v=1623346351"
//    case biceps = "https://manofmany.com/wp-content/uploads/2020/06/best-bicep-exercises.jpg"
    case legs = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/young-woman-doing-squats-on-a-road-at-sunset-royalty-free-image-1645654296.jpg"
//    case shoulder = "https://d3h9ln6psucegz.cloudfront.net/wp-content/uploads/2010/10/Unconventional-Workout-Shoulders.jpg"
    case shoulder = "https://stronglinksfitness.com/wp-content/uploads/2019/03/wp2750610-894x1024.jpg"
    case abdominals = "https://www.bodybuilding.com/images/2016/july/monster-abs-are-made-in-the-winter-header-v2s-960x540.jpg"
    case hamstring = "https://www.t-nation.com/wp-content/uploads/2018/12/Pre-Stimulation-Hamstring-Training.jpeg"
    case quadriceps = "https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/11/Quad-muscle-exercises.jpg?fit=1600%2C1065&ssl=1"
    case calf = "https://pbs.twimg.com/media/Cw8mBqXXgAEDERC.jpg"
//    case glutes = "https://www.bodybuilding.com/images/2016/december/the-guys-guide-to-great-glutes-tall-v2.jpg"
    case glutes = "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F05%2F07%2Fglute-kickback.jpg"
    
    case trapezius = "http://cdn.shopify.com/s/files/1/1901/6815/articles/new_cover_traps_600x.png?v=1531458740"
//    case fullBody = "https://wallpaperaccess.com/full/1484388.jpg"
    case fullBody = "https://post.healthline.com/wp-content/uploads/2021/04/957377-The-6-Best-Kettlebells-You-Can-Buy-in-2021-1200x628-Facebook.jpg"
}

func getImage_url(for muscle: Muscle) -> String {
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
    case .fullBody:
        return MuscleImageLink.fullBody.rawValue
    }
}

func getImageURL(for session: SessionEntity) -> String {
    var image_url_string = ""
    
    if session.exercises.count > 0 {
        let exercise = session.exercises.first
        if let muscleEnum = Muscle(rawValue: exercise!.unwrappedMuscle) {  //Creates a muscle enum from the exercise muscle name
            image_url_string = getImage_url(for: muscleEnum)
            
        } else {
            image_url_string = MuscleImageLink.fullBody.rawValue
        }
        
    } else {
        image_url_string = MuscleImageLink.fullBody.rawValue
    }
    
    return image_url_string
}


//func calculateWeight(for exercise: ExerciseEntity) -> Double {
//    var total: Double = 0
//    
//    let exercise_sets = (exercise.setsPerformed_ as? Set<SetEntity>) ?? []
//    let sets_array = Array(exercise_sets)
//    
//    for index in sets_array.indices {
//        
//        let weight = sets_array[index].weight
//        let reps = sets_array[index].reps
//        total = total + (weight * reps)
//    }
//    
//    return total
//}


//I will use this function for testing purpose, it takes an Int and return a new date from the past. For example if i call the function with 10 as the argument, it will return a new date 10 days in the past
extension Date {
    static func go_inThe_past(by numDays: Int, from date: Date) -> Date {
        if let date = Calendar.current.date(byAdding: .day, value: -numDays, to: date) {
            return date
        } else {
            return Date()
        }
        
    }
    
    
    func medium_asString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
