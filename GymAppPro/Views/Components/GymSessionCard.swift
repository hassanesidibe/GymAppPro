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

    init(_ session: SessionEntity) {
        self.session = session
    }

    
    var body: some View {

        VStack {
            AsyncImage(url: URL(string: getRandomImageURL())) { image in
                image
                    .resizable()
                    .scaledToFill()
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .bottom)
                    .foregroundColor(.white).opacity(0.7)
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
    
}



//struct GymSessionCard_Previews: PreviewProvider {
//    static var previews: some View {
//        GymSessionCard(session: DemoModel.allGymSessions[0])
//    }
//}
