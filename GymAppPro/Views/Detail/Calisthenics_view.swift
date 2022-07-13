//
//  Calisthenics_view.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 7/11/22.
//

import Foundation
import SwiftUI
import WebKit


//EVERYTHING IS WORKING PROPERLY HERE, SHOW THE VIDEOS USING NAVIGATION LINK IN WEIGHT TUTORIAL

struct Calisthenics_view: View {
    
    typealias Muscle = Calisthenic.Muscle
    
    private var chest = Calisthenic(muscle: .chest)
    private var back = Calisthenic(muscle: .back)
    private var shoulder = Calisthenic(muscle: .shoulder)
    private var ab = Calisthenic(muscle: .ab)
    private var arm = Calisthenic(muscle: .arm)
    private var leg = Calisthenic(muscle: .leg)
    
    @State private var selectedMuscle = Muscle.chest
    @State private var showWebView = false
    @State private var url = ""
    
    var body: some View {
        
        VStack {
            
            Picker("", selection: $selectedMuscle) {
                ForEach(Calisthenic.Muscle.allCases, id: \.self) {muscle in
                    Text(muscle.rawValue)
                }
            }
            switch selectedMuscle {
            case .chest: exerciseList(for: chest)
            case .back: exerciseList(for: back)
            case .shoulder: exerciseList(for: shoulder)
            case .ab: exerciseList(for: ab)
            case .arm: exerciseList(for: arm)
            case .leg: exerciseList(for: leg)
            }
        }
    }
    
    
    func exerciseList(for muscle: Calisthenic) -> some View {
        return LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
            ForEach(muscle.exercises.indices) {index in
                    let exerciseName = muscle.exercises[index].name
                    let imgUrl = muscle.exercises[index].imageUrl
                let videoUrl = muscle.exercises[index].videoUrl
                
                NavigationLink(destination: {
                    WebView(url: URL(string: videoUrl)!)
                }) {
                    ImageCard(for: exerciseName, imageUrl: imgUrl)
                }
                
                
//                NavigationLink(destination: WebView(url: URL(string: videoUrl)!)),label: {
//                    ImageCard(for: exerciseName, imageUrl: imgUrl)
//                }
                
//                    .sheet(isPresented: $showWebView) {
//                        if let url = URL(string: url) {
//                            WebView(url: url)
//                        }
//                    }
//                    .onTapGesture {
//                        print("\(exerciseName) was tapped")
//                        url = videoUrl
//                        showWebView = true
//                    }
//
//                    .sheet(isPresented: $showWebView) {
//                        if let url = URL(string: url) {
//                            WebView(url: url)
//                        }
//                    }
            }
        }
    }
}




//This struct will contain the Muscle group, exercise names, and URLs fro calesthenic exercises
struct Calisthenic {
    
    enum Muscle: String, CaseIterable {
        case chest = "Chest", back = "Back", shoulder = "Shoulder", ab = "Ab", arm = "Arm", leg = "Leg"
    }
    
    var muscle: Muscle
    var exercises: [(name: String, videoUrl: String, imageUrl: String)] = []
    
    init(muscle: Calisthenic.Muscle) {
        self.muscle = muscle
        self.exercises = Calisthenic.create_exercises(for: muscle)
    }
    
    mutating func addExercise(name: String, videoUrl: String, imageUrl: String) {
        exercises.append((name, videoUrl, imageUrl))
    }
}

extension Calisthenic {
    
    static func create_exercises(for muscle: Calisthenic.Muscle) -> [(name: String, videoUrl: String, imageUrl: String)] {
        switch muscle {
        case .chest: return get_chest_exercises()
        case .back: return get_back_exercises()
        case .shoulder: return get_shoulder_exercises()
        case .ab: return get_ab_exercises()
        case .arm: return get_arm_exercises()
        case .leg: return get_leg_exercises()
        }
    }
    
    static func get_chest_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
//        let exercises: [(name: String, url: String)] =
        return [
            ("Incline Push-ups", "https://www.youtube.com/watch?v=Z0bRiVhnO8Q", "https://madbarzpictures.blob.core.windows.net/madbarzpictures/inclinedpushup2.jpg"),
            ("Push-ups", "https://www.youtube.com/watch?v=IODxDxX7oi4", "https://d3h9ln6psucegz.cloudfront.net/wp-content/uploads/2021/11/Workout-Challenge-670x370.jpg"),
            ("Decline Push-ups", "https://www.youtube.com/watch?v=SKPab2YC8BE", "https://blog.fitplanapp.com/wp-content/uploads/2019/05/bodyweight-training-pushup-1200x520.jpg"),
            ("Close-Hands Push Ups (Diamond Push-Ups)", "https://www.youtube.com/watch?v=J0DnG1_S92I", "https://ak.picdn.net/offset/photos/602731496f52af4409fdab98/medium/offset_1096241.jpg"),
            ("Wide-Hands Push-Ups", "https://www.youtube.com/watch?v=B78GwfC-87Y", "https://thumbs.dreamstime.com/b/young-athletic-man-doing-push-ups-fitness-model-outdoor-workout-muscular-strong-guy-exercising-portrait-black-105287716.jpg"),
            ("Chest Dips", "https://www.youtube.com/watch?v=wjUmnZH528Y", "https://i2.wp.com/getfitathleticclub.com/wp-content/uploads/2017/09/GetFit_ChestExerciseShoulderProblems_2.jpg?resize=800%2C449&ssl=1")
        ]
    }
    
    static func get_back_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
        return [ ("Pull-ups", "https://www.youtube.com/watch?v=eGo4IYlbE5g", "https://cdn.muscleandstrength.com/sites/default/files/field/feature-image/workout/dipchin.jpg"),
                 ("Chin-ups", "https://www.youtube.com/watch?v=bd_A0kDAyK4", "https://www.bodybuilding.com/images/2016/december/how-to-keep-chin-ups-from-jacking-you-up-header-v2-830x467.jpg"),
                 ("Close-Hands Pull-ups", "https://www.youtube.com/watch?v=eGo4IYlbE5g", "https://www.bodbot.com/Images/exercises/hi-res/realname/pull-ups---narrow-grip-.jpg"),
                 ("Wide-Hands Pull-ups", "https://www.youtube.com/watch?v=eGo4IYlbE5g", "https://www.verywellfit.com/thmb/0nYceB1rYuZufagSaVcoFb4_XBA=/1000x1000/smart/filters:no_upscale()/VW-Fit-11-best-pull-up-bars-4159462-3b60260f691046d69b720369bcf13735.jpg"),
                 ("Inverted Rows", "https://www.youtube.com/watch?v=XZV9IwluPjw", "https://upload.wikimedia.org/wikipedia/commons/8/81/Inverted_row.jpg")
                ]
    }
    
    static func get_shoulder_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
        return [ ("Pike Push-ups", "https://www.youtube.com/watch?v=sposDXWEB0A", "https://sciencebehindfitness.com/wp-content/uploads/2020/08/Shirtless-Man-doing-pike-push-ups1-min-1024x683.jpg"),
                 ("Handstand Push-ups", "https://www.youtube.com/watch?v=YdBSefJNbB8", "https://images.contentstack.io/v3/assets/blt45c082eaf9747747/blt2c3e741ea4156df4/5dee7c59d03adf37d49cc286/Florian_HSPU_ES_HEAD.jpg?width=1200&height=630&fit=crop"),
                 ("Handstand Holds", "https://www.youtube.com/watch?v=iheKhObIzSA", "https://i.ytimg.com/vi/yHuLx1J9orw/maxresdefault.jpg"),
                 ("Dive Bomber Push-ups", "https://www.youtube.com/watch?v=U87gigSOgqs", "https://images.ctfassets.net/3s5io6mnxfqz/4IGB3MbjmbDi0shS7QVwNt/a28d350d20b0b7e728b06aa30fc7463e/AdobeStock_224749219.jpeg?fm=jpg&w=900&fl=progressive")
        ]
    }
    
    static func get_ab_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
        return [ ("Plank", "https://www.youtube.com/watch?v=pSHjTRCQxIw&t=3s", "https://a9p9n2x2.stackpathcdn.com/wp-content/blogs.dir/1/files/2020/12/iStock-912023284.jpg"),
                 ("Side Plank", "https://www.youtube.com/watch?v=NXr4Fw8q60o", "https://c8.alamy.com/comp/2G3WKMM/fit-athletic-black-woman-standing-in-side-plank-on-yoga-mat-in-home-living-room-doing-strenght-exercises-training-for-healthy-lifestyle-full-lenght-of-african-american-working-out-2G3WKMM.jpg"),
                 ("Hanging Knee Raises", "https://www.youtube.com/watch?v=OLR-NDGDefg", "http://cdn.shopify.com/s/files/1/1633/7705/articles/hanging_leg_raises_600x.jpg?v=1645772722"),
                 ("Hanging Leg Raises", "https://www.youtube.com/watch?v=7g1hxdkulsE", "https://thumbs.dreamstime.com/b/fit-man-exercising-his-abs-hanging-leg-raises-man-doing-pull-ups-outdoors-fit-man-exercising-his-abs-hanging-leg-raises-205927290.jpg"),
                 ("Front Levers", "https://www.youtube.com/watch?v=qu62URcSiPo", "https://i.ytimg.com/vi/T6GZIJMMWVc/maxresdefault.jpg"),
                 ("Bicycles", "https://www.youtube.com/watch?v=SFIJlNdg6I4", "https://cdn.jwplayer.com/thumbs/w4tuY6kp-720.jpg"),
                 ("Flutter Kicks", "https://www.youtube.com/watch?v=ANVdMDaYRts", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/for-firm-abdomen-royalty-free-image-1047643238-1565817235.jpg"),
                 ("Dragon Flags", "https://www.youtube.com/watch?v=moyFIvRrS0s", "https://www.menshealth.com.au/wp-content/uploads/2021/05/man-doing-ab-workout.jpg"),
                 ("Windshield Wipers", "https://www.youtube.com/watch?v=arDUVmCzyhc", "https://www.street-workouts.com/wp-content/uploads/2015/11/hanging-whipers-Catalin-Petolea.jpg"),
                 ("Legs Hold (6-inches)", "https://www.youtube.com/watch?v=1CpgAh7wdDk", "https://i.ytimg.com/vi/ZLYLY0JX-NY/maxresdefault.jpg")]
    }
    
    static func get_arm_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
        return [("Dips", "https://www.youtube.com/watch?v=sM6XUdt1rm4&t=1s", "https://cdn.shopify.com/s/files/1/0327/8461/3514/files/AG_00150.jpg?v=1631279200"),
                ("Dip Holds", "https://www.youtube.com/watch?v=bY3uwrulJAg", "https://cdn.pullup-dip.com/media/image/ac/84/d9/dip-muscles_600x600.jpg"),
                ("Inverted Rows", "https://www.youtube.com/watch?v=XZV9IwluPjw&t=10s", "https://img.freepik.com/free-photo/muscular-african-american-athlete-black-workout-gear-doing-bodyweight-rows-mobile-bars-against-white-wall-light-wooden-floor_346278-1707.jpg"),
                ("Close-Grip Chin-ups", "https://www.youtube.com/watch?v=lWjy5CPNSx4", "https://www.ammfitness.co.uk/information-advice/wp-content/uploads/2019/11/close-grip-pull-up.jpeg"),
                ("Bench Dips", "https://www.youtube.com/watch?v=c3ZGl4pAwZ4", "https://static1.bigstockphoto.com/4/0/4/large1500/404230589.jpg"),
                ("Diamond Pushups", "https://www.youtube.com/watch?v=J0DnG1_S92I", "https://garagegympro.com/wp-content/uploads/2021/05/Diamond-Push-Up-With-Equipment.jpg")]
    }
    
    static func get_leg_exercises() -> [(name: String, videoUrl: String, imageUrl: String)] {
        return [("Squats", "https://www.youtube.com/watch?v=jQr-Zo4m0os", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/mature-strong-man-lifting-weights-at-cross-training-royalty-free-image-1651253779.jpg?crop=1.00xw:0.752xh;0,0.212xh&resize=1200:*"),
                ("Pistol Squats", "https://www.youtube.com/watch?v=1-Yuq9pD7JY", "https://www.outsideonline.com/wp-content/uploads/2020/05/07/moves-pistol-squat_h.jpg"),
                ("Squat Jumps", "https://www.youtube.com/watch?v=DeTBwEL4m7s", "https://www.verywellfit.com/thmb/zbAcC2WNBM_knc-7x-e7ODBs9HI=/1885x1414/smart/filters:no_upscale()/GettyImages-9720327901-d92322e6c0454d298ae0d43da9eb3b61.jpg"),
                ("Lunges", "https://www.youtube.com/watch?v=3XDriUn0udo", "https://www.outsideonline.com/wp-content/uploads/2020/01/31/lunges-workout-exercise_h.jpg?width=1200"),
                ("Box Jumps (Bench Jumps)", "https://www.youtube.com/watch?v=hxldG9FX4j4", "https://image.boxrox.com/2020/11/dani-speegle-box-jump-over-scaled-e1637337556649.jpg"),
                ("Calf Raises", "https://www.youtube.com/watch?v=gwLzBJYoWlI", "https://cathe.com/wp-content/uploads/2017/11/shutterstock_156888575.jpg"),
                ("Wall Sits", "https://www.youtube.com/watch?v=y-wV4Venusw", "https://cdn2.stylecraze.com/wp-content/uploads/2014/04/734-Wall-Sit-Exercise-–-How-to-Do-And-What-Are-Its-Benefits.jpg")]
    }
}


struct ImageCard: View {
    
    let exerciseName: String
    let imageUrl: String
    
    init(for exerciseName: String, imageUrl: String) {
        self.exerciseName = exerciseName
        self.imageUrl = imageUrl
    }
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .bottom)
                    .foregroundColor(.white).opacity(0.7)
//                    .frame(width: .infinity)
            }
        }
        .frame(width: 170, height: 200, alignment: .top)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
            startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 15)
        
        .overlay(alignment: .bottom) {
            Text(exerciseName)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .font(.headline)
                .padding()
        }
    }
}
