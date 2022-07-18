//
//  ExerciseTutorialView.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 4/17/22.
//

import SwiftUI
import WebKit



struct WebView: UIViewRepresentable {
    
    var url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// START OF NEW TUTORIAL VIEW

enum Tutorial_type: String, CaseIterable {
    case wight = "Weight", calisthenics = "calisthenics", cardio = "Cardio"
}



struct New_tutorial_view: View {
    @State private var tutorial_type: Tutorial_type = .wight
    @State private var showTutorial = false
    
    @State private var muscleToShow_video_for = Muscle.chest
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                    Tutorial_type_picker
                    .padding([.leading, .trailing])
                
                switch tutorial_type {
                    
                    case .wight:
                    
                    Weight_tutorial_view()
                        
                    case .calisthenics:
                        Calisthenics_view()
                        
                        
                    case .cardio:
                        Cardio_View()
                }
            }
            
            .navigationTitle("Tutorials")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    var Tutorial_type_picker: some View {
        Picker("", selection: $tutorial_type) {
            ForEach(Tutorial_type.allCases, id: \.self) { tutorial in
                Text(tutorial.rawValue)
            }
        }
        .pickerStyle(.segmented)
    }
}





//struct ExerciseTutorialView_Previews: PreviewProvider {
//    static var previews: some View {
//        New_tutorial_view()
//    }
//}
