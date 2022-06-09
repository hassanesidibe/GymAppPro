//
//  GymSessionMuscleImages.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/13/22.
//

import SwiftUI

/*struct GymSessionMuscleImages: View {
    let session: GymSession
    let scrollDirection: Axis.Set = .horizontal
    
    var body: some View {
        ScrollView(scrollDirection) {
           /* HStack {
               
                ForEach(session.exercises) {exercise in
                    AsyncImage(url: URL(string: getImageURL(for: exercise.muscle))) {image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white).opacity(0.7)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.3), .gray]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                }
            }
            .frame(height: 200)
            .padding()*/
            
            
            
            HStack {
               
//                ForEach(0..<getExerciseImagesWithoutDuplicates(session.exercises).count, id: \.self) {index in
                ForEach(0..<getExerciseImagesWithoutDuplicate(session.exercises).count, id: \.self) {index in
                    
                    
                    let images = getExerciseImagesWithoutDuplicate(session.exercises)
                    
                    AsyncImage(url: URL(string: images[index])) {image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white).opacity(0.7)
                    }
                    .background(LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.3), .gray]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(20)
                }
            }
            .frame(height: 200)
            .padding()
            
        }
    }
    
    
    //This function takes an array for excercises and returns a Set of URL strings corresponding to their images, without duplicates
    private func getExerciseImagesWithoutDuplicate(_ exercises: [Exercise]) -> [String] {
        var urls: [String] = []
        
        for exercise in exercises {
            let newImage = getImageURL(for: exercise.muscle)
            if !urls.contains(newImage) {
                urls.append(newImage)
            }
        }
        return urls
    }
}

struct GymSessionMuscleImages_Previews: PreviewProvider {
    static var previews: some View {
        GymSessionMuscleImages(session: DemoModel.allGymSessions[0])
    }
}

*/
