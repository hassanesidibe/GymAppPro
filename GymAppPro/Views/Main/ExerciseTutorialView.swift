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
