//
//  ExerciseTutorialView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/17/22.
//

import SwiftUI

struct ExerciseTutorialView: View {
    @State private var muscle: Muscle = .back
    
    var body: some View {
        
        NavigationView {
            VStack {
               topBadge
                    .frame(width: 400, height: 90)
                
                Picker("", selection: $muscle) {
                    ForEach(Muscle.allCases, id: \.self) {muscle in
                        Text(muscle.rawValue)
                            .font(.largeTitle)
                    }
                }
                .pickerStyle(.menu)
                
                Button(action: {
                    
                }) {
                    Text("Search")
                        .foregroundColor(.red)
                }
                
                Spacer()
            }
            
            .navigationTitle("Tutorials")
        }
    }
    
    var topBadge: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.indigo)
                .opacity(0.7)
            Text("Select muscle and dates to see your progress")
                .bold()
                .foregroundColor(.white)
        }
    }
}

struct ExerciseTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTutorialView()
    }
}
