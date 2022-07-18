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


func getUpper_body_muscles() -> [Muscle] {
    let upper_body_muscles: [Muscle] = [.back, .biceps, .chest, .tricep, .shoulder, .trapezius]
    return upper_body_muscles
}

func getLower_body_muscles() -> [Muscle] {
    let lowerBody_muscles: [Muscle] = [.hamstring, .quadriceps, .glutes, .calf, .legs]
    return lowerBody_muscles
}

enum MuscleImageLink: String {
    case chest = "https://www.teahub.io/photos/full/66-660101_chest-workout.png"
    case tricep = "https://www.muscleandfitness.com/wp-content/uploads/2018/01/man-bodyweight-dip-1109.jpg?quality=86&strip=all"
    case back = "https://cdn.shopify.com/s/files/1/1915/0785/files/seated-pulley-row-2-0_large.jpg?v=1585509781"
    case biceps = "https://cdn.shopify.com/s/files/1/1876/4703/articles/shutterstock_1931706245_1000x.jpg?v=1623346351"
    case legs = "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/young-woman-doing-squats-on-a-road-at-sunset-royalty-free-image-1645654296.jpg"
    case shoulder = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmBPh-70mFcXNjSzKh0x-WPcutoZ7yu4Q3qg&usqp=CAU"
    case abdominals = "https://www.bodybuilding.com/images/2016/july/monster-abs-are-made-in-the-winter-header-v2s-960x540.jpg"
    case hamstring = "https://www.t-nation.com/wp-content/uploads/2018/12/Pre-Stimulation-Hamstring-Training.jpeg"
    case quadriceps = "https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/11/Quad-muscle-exercises.jpg?fit=1600%2C1065&ssl=1"
    case calf = "https://manofmany.com/wp-content/uploads/2020/02/Best-Calf-Exercises.jpg"
    case glutes = "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F05%2F07%2Fglute-kickback.jpg"
    case trapezius = "http://cdn.shopify.com/s/files/1/1901/6815/articles/new_cover_traps_600x.png?v=1531458740"
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

func getRandomImageURL() -> String {
    let images_urls = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmBPh-70mFcXNjSzKh0x-WPcutoZ7yu4Q3qg&usqp=CAU",
                        "https://cutewallpaper.org/22/dwayne-johnson-workout-wallpapers/28039627.jpg",
                       "https://cdn.shopify.com/s/files/1/1915/0785/files/seated-pulley-row-2-0_large.jpg?v=1585509781",
                       "https://c4.wallpaperflare.com/wallpaper/735/263/743/muscle-muscle-training-dumbbells-wallpaper-preview.jpg",
                       "https://miro.medium.com/max/1071/1*WNr4o3XKVcb556Al3beWAQ.jpeg",
                       "https://cdn.shopify.com/s/files/1/1876/4703/articles/shutterstock_1931706245_1000x.jpg?v=1623346351",
                       "https://post.healthline.com/wp-content/uploads/2021/04/957377-The-6-Best-Kettlebells-You-Can-Buy-in-2021-1200x628-Facebook.jpg",
                       "http://cdn.shopify.com/s/files/1/1901/6815/articles/new_cover_traps_600x.png?v=1531458740",
                       "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F05%2F07%2Fglute-kickback.jpg",
                       "https://i0.wp.com/www.strengthlog.com/wp-content/uploads/2020/11/Quad-muscle-exercises.jpg?fit=1600%2C1065&ssl=1",
                       "https://www.t-nation.com/wp-content/uploads/2018/12/Pre-Stimulation-Hamstring-Training.jpeg",
                       "https://post.healthline.com/wp-content/uploads/2021/04/957377-The-6-Best-Kettlebells-You-Can-Buy-in-2021-1200x628-Facebook.jpg",
                       "https://manofmany.com/wp-content/uploads/2020/02/Best-Calf-Exercises.jpg",
                       "https://images.everydayhealth.com/images/what-is-liss-cardio-a-detailed-beginners-guide-1440x810.jpg",
                       "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F35%2F2020%2F02%2FGettyImages-1081398308-2000.jpg",
                       "https://www.muscleandfitness.com/wp-content/uploads/2018/01/man-bodyweight-dip-1109.jpg?quality=86&strip=all"
                        ]
    
    
    
    return images_urls.randomElement()!
}



func get_tutorial_url(for muscle: Muscle) -> String {
    switch muscle {
        case .abdominals: return "https://www.youtube.com/results?search_query=top+10+abs+workout"
        case .back: return "https://www.youtube.com/results?search_query=best+back+workout"
        case .biceps: return "https://www.youtube.com/results?search_query=best+biceps+workout"
        case .calf: return "https://www.youtube.com/results?search_query=best+calf+workout"
        case .chest: return "https://www.youtube.com/results?search_query=best+chest+exercises"
        case .fullBody: return "https://www.youtube.com/results?search_query=best+full+body+workout"
        case .glutes: return "https://www.youtube.com/results?search_query=best+glute+workout"
        case .hamstring: return "https://www.youtube.com/results?search_query=best+hamstring+exercises"
        case .legs: return "https://www.youtube.com/results?search_query=best+leg+exercises"
        case .quadriceps: return "https://www.youtube.com/results?search_query=best+quadriceps+exercises"
        case .tricep: return "https://www.youtube.com/results?search_query=best+triceps+exercises"
        case .shoulder: return "https://www.youtube.com/results?search_query=best+shoulder+exercises"
        case .trapezius: return "https://www.youtube.com/results?search_query=best+trap+exercises"
    }
}

//func calisthenic_images_urls() -> [String]{
//    return ["https://d3h9ln6psucegz.cloudfront.net/wp-content/uploads/2020/11/4-Bodyweight-Training-Myths-Busted.jpeg",
//            "https://cdn.pullup-dip.com/media/image/1b/f1/6b/calisthenics-trainingsplan-title.jpg",
//            "https://cdn.shopify.com/s/files/1/2438/8213/articles/IMG_0050_800x.JPG?v=1548309282",
//            "https://cdn.muscleandstrength.com/sites/default/files/field/feature-wide-image/workout/calisthenics_for_lifters_-_1000x500.jpg"]
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
