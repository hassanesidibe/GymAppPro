//
//  Cardio_View.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 7/13/22.
//

import SwiftUI

struct Cardio_View: View {
    
    private var cardioExercies = [(name: "Jump rope", videoUrl: "https://www.youtube.com/watch?v=u3zgHI8QnqE", imageUrl: "https://static.nike.com/a/images/f_auto,cs_srgb/w_1536,c_limit/550abc16-1f02-446e-b5ce-60e9df5430ab/what-are-the-benefits-of-jumping-rope-every-day.jpg"),
                                  (name: "Moving plank", videoUrl: "https://www.youtube.com/watch?v=0VeQaYlQixY", imageUrl: "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/hdm119918mh15842-1545237096.png"),
                                  (name: "Overhead loaded carries", videoUrl: "https://www.youtube.com/watch?v=euj4FvcCags", imageUrl: "https://theprogrm.com/wp-content/uploads/overhead-carry.jpg"),
                                  (name: "Machine row", videoUrl: "https://www.youtube.com/watch?v=w2hGNM4l5so", imageUrl: "https://experiencelife.lifetime.life/wp-content/uploads/2022/01/mar22-wo-reap-what-you-row.jpg"),
                                  (name: "Treadmill Sprints", videoUrl: "https://www.youtube.com/watch?v=n4I_fmegTRk", imageUrl: "https://www.xtr.gr/images/detailed/25/06-382-001-Διάδρομος-γυμναστική-Sprintbok-Ash-web3.jpg"),
                                  (name: "VersaClimber", videoUrl: "https://www.youtube.com/watch?v=rWNs__eIRtU", imageUrl: "https://d1wwxmucvg1t4q.cloudfront.net/listing/x576/photo-193973.jpg")
    ]
    
    var body: some View {
        
        VStack {
            title
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                ForEach(cardioExercies.indices) {index in
                    NavigationLink {
                        WebView(url: URL(string: cardioExercies[index].videoUrl)!)
                    } label: {
                        ImageCard(for: cardioExercies[index].name, imageUrl: cardioExercies[index].imageUrl)
                    }

                }
            }
        }
    }
    
    var title: some View {
        HStack {
            Text("Cardio")
                .font(.title2)
                .bold()
                .padding(.leading)
            Spacer()
        }
    }
}

//struct Cardio_View_Previews: PreviewProvider {
//    static var previews: some View {
//        Cardio_View()
//    }
//}
