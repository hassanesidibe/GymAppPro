//
//  GymSessionCard.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

struct GymSessionCard: View {
    
    var session: GymSession
    
    var body: some View {
        
        
        VStack {
            //The image i used here should be comming from the exercises in the gym session, based on the muscle group
//            AsyncImage(url: URL(string: "https://www.t-nation.com/wp-content/uploads/2018/12/Pre-Stimulation-Hamstring-Training.jpeg")) {image in
            AsyncImage(url: URL(string: getImageURL(for: session.exercises[0].muscle))) {image in
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
        .frame(width: 170, height: 215)
        .background(LinearGradient(colors: [.gray.opacity(0.3), .gray], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
        .overlay(alignment: .bottom) {
            Text(session.getDateAsString())
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }
        .overlay(alignment: .top) {
            Text(session.exercises[0].muscle.rawValue)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }
    }
}


//This view let you scroll horizontaly on the gym sessions in home view, to see the diferrent muscle groups you worked on
struct ScrollableGymSessionCard: View {
    var exrecises: [Exercise]
    
    var body: some View {
        VStack {
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(exrecises) {exercise in
                        AsyncImage(url: URL(string: getImageURL(for: exercise.muscle))) {image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 170)
                            
                                .overlay(alignment: .top) {
                                    Text(exercise.muscle.rawValue)
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 5, x: 0, y: 0)
                                        .padding()
                                }
                            
                        } placeholder: {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .opacity(0.7)
                                .frame(width: 100, height: 100)
                        }
                    }
                }
            }
        }
        .frame(width: 170, height: 215)
        .background(LinearGradient(colors: [.gray.opacity(0.3), .gray], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 22))
        .shadow(color: .black.opacity(0.4), radius: 15, x: 0, y: 15)
        /*.overlay(alignment: .bottom) {
            Text(session.getDateAsString())
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }*/
        /*.overlay(alignment: .top) {
            Text(exercises.muscle.rawValue)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 5, x: 0, y: 0)
                .padding()
        }*/
    }
}



struct GymSessionCard_Previews: PreviewProvider {
    static var previews: some View {
        GymSessionCard(session: DemoModel.allGymSessions[0])
    }
}
