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
//    private var muscles: [Muscle]
//    private var upperBody_muscles: [Muscle]
//    private var lowerBody_muscles: [Muscle]
    
    
    init() {
    }
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                    Tutorial_type_picker
                    .padding([.leading, .trailing])
                
                switch tutorial_type {
                    
                case .wight:
                    VStack {
                        upper_body_title
                        upper_body_scrollView
                        
                        lower_body_title
                        lower_body_scrollView
                    }
                    .padding()
                    
                case .calisthenics:
//                    Text("Calisthenics")
                    Calisthenics_view()
                    
                    
                case .cardio:
                    Text("Cardio")
                }
            }
            
            .navigationTitle("Tutorials")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    
    var upper_body_scrollView: some View {
//        ScrollView(.horizontal) {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                
                ForEach(getUpper_body_muscles(), id: \.self) {muscle in
                    Tutorial_card(for: muscle)
                        .onTapGesture {
//                            SHOW A YOUTUBE PLAYLIST FOR SPECIFIED MUSCLE

                            muscleToShow_video_for = muscle
                            
                            if muscleToShow_video_for != nil { showTutorial = true }
//                            showTutorial = true
                        }
                        .sheet(isPresented: $showTutorial) {
                            WebView(url: URL(string: get_tutorial_url(for: muscleToShow_video_for))!)
                        }
                }
                
            }
//        }
    }
    
    var lower_body_scrollView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 160))]) {
                ForEach(getLower_body_muscles(), id: \.self) {muscle in
                    Tutorial_card(for: muscle)
                        .onTapGesture {
//                            SHOW A YOUTUBE PLAYLIST FOR SPECIFIED MUSCLE
                            
                        }
                }
            }
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
    
    
    var upper_body_title: some View {
        HStack {
            Text("Upper body")
                .font(.title2)
                .bold()
                .padding(.leading)
            Spacer()
        }
    }
    
    var lower_body_title: some View {
        HStack {
            Spacer()
            Text("Lower body")
                .font(.title2)
                .bold()
                .padding()
        }
    }
}





struct ExerciseTutorialView_Previews: PreviewProvider {
    static var previews: some View {
//        ExerciseTutorialView()
        New_tutorial_view()
    }
}
