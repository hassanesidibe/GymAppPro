//
//  Weight_tutorial_view.swift
//  GymAppPro
//
//  Created by Hassane Sidibe on 7/13/22.
//

import SwiftUI

struct Weight_tutorial_view: View {
    
    var body: some View {
        VStack {
            
            VStack {
                
                HStack {
                    Text("Upper body")
                        .font(.title2)
                        .bold()
                        .padding(.leading)
                    Spacer()
                }
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 20)], spacing: 20) {
                        
                        ForEach(getUpper_body_muscles(), id: \.self) {muscle in
                            
                            NavigationLink(destination: {
                                WebView(url: URL(string: get_tutorial_url(for: muscle))!)
                            }) {
                                Tutorial_card(for: muscle)
                            }
                        }
                        
                    }
            }
            
            
            VStack {
                HStack {
                    Spacer()
                    Text("Lower body")
                        .font(.title2)
                        .bold()
                        .padding()
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(getLower_body_muscles(), id: \.self) {muscle in
                            NavigationLink {
                                WebView(url: URL(string: get_tutorial_url(for: muscle))!)
                            } label: {
                                Tutorial_card(for: muscle)
                            }

                        }
                    }
                }
            }
            
            
        }
    }
}

//struct Weight_tutorial_view_Previews: PreviewProvider {
//    static var previews: some View {
//        Weight_tutorial_view()
//    }
//}
