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
    private var muscles: [Muscle]
    
    init() {
        muscles = Muscle.allCases
    }
    
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                    Tutorial_type_picker
                    .foregroundColor(.blue)
//                    .padding()
                
                VStack {
                    upper_body_title
                    upper_body_scrollView
                    
                    lower_body_title
                    lower_body_scrollView
                }
                .padding()
            }
            
            .navigationTitle("Tutorials")
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    
    var upper_body_scrollView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 160))]) {
                ForEach(muscles, id: \.self) {muscle in
                    Tutorial_card(for: muscle)
                }
            }
        }
    }
    
    var lower_body_scrollView: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.adaptive(minimum: 160))]) {
                ForEach(muscles, id: \.self) {muscle in
                    Tutorial_card(for: muscle)
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







////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// END OF NEW TUTORIAL VIEW


struct ExerciseTutorialView: View {
    @State private var muscle: Muscle = .back
    @State private var show_tutorial_video = false
    @State private var tutoial_url = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                VStack { }.padding()
                
               topBadge
                    .frame(width: 400, height: 90)
                
                Form {
                    Picker("", selection: $muscle) {
                        ForEach(Muscle.allCases, id: \.self) {muscle in
                            Text(muscle.rawValue)
                                .font(.largeTitle)
                        }
                    }
                    .pickerStyle(.menu)
                    .font(.largeTitle)
                    
                    show_demo_video_button
                }
                .sheet(isPresented: $show_tutorial_video) {
                    WebView(url: URL(string: get_tutorial_url())!)
                }
                
                
                /*Link(destination: URL(string: "https://www.youtube.com/watch?v=qVC129FGdno")!, label: {
                    Text("Search")
                })*/
                
                
                
//                Button(action: {
//
//                }) {
//                    Text("Search")
//                        .foregroundColor(.red)
//                }
                
                Spacer()
            }
            
            .navigationTitle("Tutorials")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func get_tutorial_url() -> String {
        switch muscle {
        case .abdominals: return "https://www.youtube.com/results?search_query=top+10+abs+workout"
        case .back: return "https://www.youtube.com/results?search_query=best+back+workout"
        case .biceps: return "https://www.youtube.com/results?search_query=best+biceps+workout"
        case .calf: return "https://www.youtube.com/results?search_query=best+calf+workout"
        case .chest: return "https://www.youtube.com/results?search_query=best+chest+exercises"
        case .fullBody: return "https://www.youtube.com/results?search_query=best+full+body+workout"
        case .glutes: return "https://www.youtube.com/results?search_query=best+glute+workout"
        case .hamstring: return "https://www.youtube.com/results?search_query=best+hamstring+exercises"
        case .legs: return "https://www.youtube.com/results?search_query=best+leg+exercises"
        case .quadriceps: return "https://www.youtube.com/results?search_query=best+quadriceps+exercises"
        case .tricep: return "https://www.youtube.com/results?search_query=best+triceps+exercises"
        case .shoulder: return "https://www.youtube.com/results?search_query=best+shoulder+exercises"
        case .trapezius: return "https://www.youtube.com/results?search_query=best+trap+exercises"
        }
    }
    
    
    var show_demo_video_button: some View {
        Button(action: {
            show_tutorial_video = true
        }) {
            
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(.red).opacity(0.9)
                .frame(width: 400, height: 50)
                .overlay(
                    Text("Show Video").foregroundColor(.white)
                )
        }
    }
    
    var topBadge: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.indigo)
                .opacity(0.9)
            Text("Select a muscle to get exercise suggestions")
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
