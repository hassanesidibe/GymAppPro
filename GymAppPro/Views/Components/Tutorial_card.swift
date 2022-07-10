//
//  Tutorial_card.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 7/7/22.
//

import Foundation
import SwiftUI

struct Tutorial_card: View {
    var muscle: Muscle
    init(for muscle: Muscle) { self.muscle = muscle }
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: getImage_url(for: self.muscle))) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white).opacity(0.7)
            }
        }
        .frame(width: 160, height: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.3), radius: 15, x: 0, y: 15)
        .overlay(alignment: .bottom) {
            Text(muscle.rawValue)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
                .font(.headline).padding()
        }
    }
}


