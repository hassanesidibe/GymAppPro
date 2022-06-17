//
//  GymSessionCard.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI
import CoreData

struct GymSessionCard: View {

    var session: SessionEntity
//    let context: NSManagedObjectContext

    init(_ session: SessionEntity) {
        self.session = session
//        self.context = context
    }

    
    
    ////////////////////////////////////////////////////

    
    var body: some View {

        VStack {
//            AsyncImage(url: URL(string: "https://miro.medium.com/max/1001/1*9OrxMWzC6ARoatL1rrufQg.jpeg")) { image in
            AsyncImage(url: URL(string: getImageURL(for: session))) { image in
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
        .frame(width: frameWidth, height: frameHeight, alignment: .top)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]),
            startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 15)
        
        .overlay(alignment: .bottom) {
            Text(session.unwrappedShortName)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .font(.headline)
                .padding()
        }
    }
    
    private let frameWidth: CGFloat = 160
    private let frameHeight: CGFloat = 217
    
    
    /*func getImageURL(for session: SessionEntity) -> String {
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
    }*/
    
    //////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
var body: some View {


    VStack {
            //The image i used here should be comming from the exercises in the gym session, based on the muscle group
            AsyncImage(url: URL(string: "https://www.t-nation.com/wp-content/uploads/2018/12/Pre-Stimulation-Hamstring-Training.jpeg")) {image in
//            AsyncImage(url: URL(string: getImageURL(for: session.exercises[0].muscle))) {image in
                image
                    .resizable()
                    .scaledToFill()

            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .opacity(0.7)
                    .frame(width: 100, height: 100)
            }
        }

    VStack {
        Image(systemName: "photo")
            .resizable()
            .scaledToFit()
            .opacity(0.7)
            .frame(width: 100, height: 100)
        }
        .frame(width: 170, height: 215)
        .background(LinearGradient(colors: [.gray.opacity(0.3), .gray], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
        .overlay(alignment: .bottom) {
            Text("\(session.unwrappedShortName)")
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }
        .overlay(alignment: .top) {
            Text("Dummy Muscle")
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }
    }*/
    
    
    
    
}


//This view let you scroll horizontaly on the gym sessions in home view, to see the diferrent muscle groups you worked on
//struct ScrollableGymSessionCard: View {
//    var exrecises: [Exercise]
//
//    var body: some View {
//        VStack {
//
//            ScrollView(.horizontal) {
//                HStack {
//                    ForEach(exrecises) {exercise in
//                        AsyncImage(url: URL(string: getImageURL(for: exercise.muscle))) {image in
//                            image
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 170)
//
//                                .overlay(alignment: .top) {
//                                    Text(exercise.muscle.rawValue)
//                                        .foregroundColor(.white)
//                                        .shadow(color: .black, radius: 5, x: 0, y: 0)
//                                        .padding()
//                                }
//
//                        } placeholder: {
//                            Image(systemName: "photo")
//                                .resizable()
//                                .scaledToFit()
//                                .opacity(0.7)
//                                .frame(width: 100, height: 100)
//                        }
//                    }
//                }
//            }
//        }
//        .frame(width: 170, height: 215)
//        .background(LinearGradient(colors: [.gray.opacity(0.3), .gray], startPoint: .top, endPoint: .bottom))
//        .clipShape(RoundedRectangle(cornerRadius: 22))
//        .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
//        /*.overlay(alignment: .bottom) {
//            Text(session.getDateAsString())
//                .foregroundColor(.white)
//                .shadow(color: .black, radius: 5, x: 0, y: 0)
//                .padding()
//        }*/
//        /*.overlay(alignment: .top) {
//            Text(exercises.muscle.rawValue)
//                .foregroundColor(.white)
//                .shadow(color: .black, radius: 5, x: 0, y: 0)
//                .padding()
//        }*/
//    }
//}



//struct GymSessionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        GymSessionCard(session: DemoModel.allGymSessions[0])
//    }
//}
